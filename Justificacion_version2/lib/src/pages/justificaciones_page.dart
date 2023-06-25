import 'package:flutter/material.dart';
import 'package:just_app/src/services/justificaciones_service.dart';

import 'package:provider/provider.dart';

import 'package:just_app/src/services/cuentas_service.dart';
import 'package:just_app/src/provider/user_data_provider.dart';


class JustificacionesPage extends StatefulWidget {
  const JustificacionesPage({
    super.key,
  });

  @override
  State<JustificacionesPage> createState() => _JustificacionesPageState();
}

class _JustificacionesPageState extends State<JustificacionesPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<JustificacionesService>(context, listen: false).cargarJustificaciones(context);
  }

  @override
  Widget build(BuildContext context){
    final cuentasService = Provider.of<CuentasService>(context);
    final userDataProvider = Provider.of<UserDataProvider>(context);
    final justificacionesService = Provider.of<JustificacionesService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('JustificacionesApp'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => <PopupMenuEntry<int>>[
            const PopupMenuItem(value: 1,child: Text('Cerrar Sesión'),)
          ],
          onSelected: (value) async {
            switch(value) {
              case 1:
                await cuentasService.logout();
                await userDataProvider.borrarDatosUsuario();
                justificacionesService.vaciarJustificaciones();
                if(context.mounted) {
                  Navigator.pushNamed(context, 'login');
                }
              break;
            }
          },
        )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido ${userDataProvider.fullName}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Justificaciones',
                    style: TextStyle(fontSize: 36),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if(userDataProvider.hasRole('alumno'))
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, 'justificaciones-form');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: justificacionesService.justificaciones.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(justificacionesService.justificaciones[index].identificador),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('id: ${justificacionesService.justificaciones[index].id}'),
                      Text('Motivo: ${justificacionesService.justificaciones[index].motivo}'),
                      if(userDataProvider.hasRole('alumno'))
                        Text('Profesor: ${justificacionesService.justificaciones[index].profesor?.nombre} ${justificacionesService.justificaciones[index].profesor?.apellidoPaterno} ${justificacionesService.justificaciones[index].profesor?.apellidoMaterno}'),
                      if(userDataProvider.hasRole('profesor'))
                        Text('Alumno: ${justificacionesService.justificaciones[index].alumno?.nombre} ${justificacionesService.justificaciones[index].alumno?.apellidoPaterno} ${justificacionesService.justificaciones[index].alumno?.apellidoMaterno}'),
                        const Divider(),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
