import 'package:app_justificacion/src/pages/justificaciones.dart';
import 'package:flutter/material.dart';



class OtrosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JUSTIFICACIONES'),
      ),
      body: ListView(
        children: <Widget>[
         ListTile(
           title: Text('JUSTIFICACION1'),
           subtitle: Text('kvncsdvnksdomfolwmfkoewmfksmkf'),
           leading: Icon(Icons.insert_drive_file_sharp),
           trailing: Icon(Icons.keyboard_arrow_right),
             onTap: (){Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JustificacionesPage()),
    );
    },
          
         ),
          Divider(),

          ListTile(
            title: Text('JUSTIFICAION2'),
            subtitle: Text('kidssadfmafmoawmdf'),
            leading: Icon(Icons.insert_drive_file_sharp),
            trailing: Icon(Icons.keyboard_arrow_right),
            

          ),
           Divider(),

          ListTile(
            title: Text('JUSTIFICAION3'),
            subtitle: Text('kidssadfmafmoawmdf'),
            leading: Icon(Icons.insert_drive_file_sharp),
            trailing: Icon(Icons.keyboard_arrow_right),
            

          ),
           Divider(),

          ListTile(
            title: Text('JUSTIFICAION4'),
            subtitle: Text('kidssadfmafmoawmdf'),
            leading: Icon(Icons.insert_drive_file_sharp),
            trailing: Icon(Icons.keyboard_arrow_right),
            

          ),

        ],
      ),
    );
  }
}