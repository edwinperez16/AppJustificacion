import 'package:flutter/material.dart';

class JustificacionesPage extends StatelessWidget {
  const JustificacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JUSTIFICACION1'),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
            children: [
              SizedBox(height: 50),
              Text('El alumno Pedro Pony con NO.Identificatorio 123456789'+
              'no pudo asistir el dia 13/07/23 por cuestiones de asunto familiar',
              style: TextStyle(fontSize: 20 ),
              textAlign: TextAlign.center,),
             
            ]
        )
      ),
    );
  }
}