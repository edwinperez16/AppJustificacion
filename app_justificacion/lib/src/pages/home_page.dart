import 'package:flutter/material.dart';

//import 'buscador.dart';
//import 'crear_justificacion.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JUSTIFICACION'),
      ),
      body: ListView(
        children: <Widget>[
         ListTile(
           title: Text('JUSTIFICACION'),
           subtitle: Text('Crear una justificacion'),
           leading: Icon(Icons.insert_drive_file_sharp),
           trailing: Icon(Icons.keyboard_arrow_right),
    //       onTap: () {Navigator.push(
    //  context,
    //  MaterialPageRoute(builder: (context) => FormularioPage()),
    //);
             
           //},
         ),
          Divider(),

          ListTile(
            title: Text('BUSCAR'),
            subtitle: Text('Buscar justificacion'),
            leading: Icon(Icons.location_searching_rounded),
            trailing: Icon(Icons.keyboard_arrow_right),
            //onTap: (){Navigator.push(
    //  context,
    //  MaterialPageRoute(builder: (context) => BuscadorPage()),
    //);},

          ),

        ],
      ),
    );
  }
}