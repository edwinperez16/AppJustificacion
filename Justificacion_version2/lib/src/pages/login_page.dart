import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:just_app/src/models/credenciales_model.dart';
import 'package:just_app/src/provider/user_data_provider.dart';
import 'package:just_app/src/services/cuentas_service.dart';
import 'package:just_app/src/styles/styles.dart';
import 'package:just_app/src/widgets/alert_dialog_custom.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Future<void> _initPage() async {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    final cuentasService = Provider.of<CuentasService>(context);

    await userDataProvider.cargarData();

    if(userDataProvider.userData.isEmpty) return;

    final DateFormat format = DateFormat("yyyy-MM-ddTHH:mm:ssZ");
    final tokenExpirationDate = format.parse(userDataProvider.tokenExpirationDate);
    final today = DateTime.now();
    final difference = today.difference(tokenExpirationDate);

    if(difference.inMinutes < 60) {
      if(context.mounted) {
        if(userDataProvider.hasRole('alumno') || userDataProvider.hasRole('profesor')) {
          Navigator.pushNamed(context, 'menu');
        }
        if(userDataProvider.hasRole('administrador')) {
          Navigator.pushNamed(context, 'grupos');
        }
        showDialog(context: context, builder: ( _ ) => const AlertDialogCustom(title: '¡Correcto!', message: 'Bienvenido de nuevo'));
      }
    } else {
      await cuentasService.logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
    final cuentasService = Provider.of<CuentasService>(context);
    final userDataProvider = Provider.of<UserDataProvider>(context);

    CredencialesModel credenciales = CredencialesModel(email: '', password: '');

    _initPage();
    

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Inicio de Sesión'),
      // ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKeyLogin,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 80.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Iniciar Sesión',
                    style: hedding1(),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    initialValue: credenciales.email,
                    onChanged: (value) => credenciales.email = value,
                    decoration: const InputDecoration(label: Text('Correo Electrónico')),
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Introduzca un email correcto'
                            : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: credenciales.password,
                    onChanged: (value) => credenciales.password = value,
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: 'Contraseña'),
                    validator: (password) {
                      if(password!.isEmpty) {
                        return 'El campo contraseña no puede ir vacio';
                      }
                      return null;
                    }
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      // Validar el formulario
                      if(formKeyLogin.currentState?.validate() ?? false) {
                        final response = await cuentasService.login(credenciales);
                        if(context.mounted) {
                          await userDataProvider.cargarData();
                          if(response.success) {
                            if(context.mounted) {
                              if(userDataProvider.hasRole('alumno') || userDataProvider.hasRole('profesor')) {
                                Navigator.pushNamed(context, 'menu');
                              }
                              if(userDataProvider.hasRole('administrador')) {
                                Navigator.pushNamed(context, 'grupos');
                              }
                              showDialog(context: context, builder: ( _ ) => AlertDialogCustom(title: '¡Correcto!', message: response.message));
                            }
                          } else {
                            if(context.mounted) {
                              showDialog(
                                context: context, 
                                builder: ( _ ) => AlertDialogCustom(title: '¡Error!', message: response.message)
                              );
                            }
                          }
                        }
                      }
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿No Tienes Cuenta?',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, 'register'),
                        child: const Text(
                          'Crear Cuenta',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}