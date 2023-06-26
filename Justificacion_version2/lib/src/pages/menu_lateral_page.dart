import 'package:flutter/material.dart';
import 'package:just_app/src/provider/user_data_provider.dart';
import 'package:just_app/src/services/cuentas_service.dart';
import 'package:just_app/src/services/justificaciones_service.dart';
import 'package:provider/provider.dart';


class MenuLateralPage extends StatelessWidget {
  const MenuLateralPage({super.key});

  @override
  Widget build(BuildContext context) {

    final cuentasService = Provider.of<CuentasService>(context);
    final userDataProvider = Provider.of<UserDataProvider>(context);
    final justificacionesService = Provider.of<JustificacionesService>(context);

    return Scaffold( 
        appBar: AppBar(
          title: Text("Menu"),
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
        body: ListView(
          padding: EdgeInsets.all(12.0),
          children: [
            ListTile(
              title: Text("Crear Justificacion", style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              leading: Icon( Icons.format_align_center_outlined ),
              trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue ),
              onTap: (){
                Navigator.pushNamed(context, "justificaciones-form" );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Justificaciones Inicio", style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              leading: Icon( Icons.list ),
              trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue ),
              onTap: (){
                Navigator.pushNamed(context, "home", );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Crear Alumno", style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              leading: Icon( Icons.list ),
              trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue ),
              onTap: (){
                Navigator.pushNamed(context, "register", );
              },
            ),
          ],
        ),
      );
  }
}