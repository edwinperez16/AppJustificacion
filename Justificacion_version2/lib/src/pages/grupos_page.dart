import 'package:flutter/material.dart';
import 'package:just_app/src/pages/justificaciones_form_page.dart';
import 'package:just_app/src/services/justificaciones_service.dart';
import 'package:provider/provider.dart';
import 'package:just_app/src/services/cuentas_service.dart';
import 'package:just_app/src/provider/user_data_provider.dart';

class Alumno {
  final String nombre;
  final String numeroControl;

  Alumno({required this.nombre, required this.numeroControl});
}

class GruposPage extends StatefulWidget {
  @override
  const GruposPage({
    super.key,
  });
  _GruposPageState createState() => _GruposPageState();
}

class _GruposPageState extends State<GruposPage> {

@override
  void initState() {
    super.initState();

    Provider.of<JustificacionesService>(context, listen: false).cargarJustificaciones(context);
  }


final TextEditingController _searchController = TextEditingController();
  List<Justificacion> _filteredJustificaciones = [];


  


  
  @override
  Widget build(BuildContext context) {

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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => justificacionesService.justificaciones.length,
              decoration: InputDecoration(
                labelText: 'Buscar',
              ),
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
                        Text('Profesor: ${justificacionesService.justificaciones[index].profesor?.nombre} ${justificacionesService.justificaciones[index].profesor?.apellidoPaterno} ${justificacionesService.justificaciones[index].profesor?.apellidoMaterno}'),                 
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

class Justificacion {
}