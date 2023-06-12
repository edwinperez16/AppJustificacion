import 'package:flutter/material.dart';



class OtrosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFFAD0837),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('JUSTIFICACIONES'),
        ),
        body: Container(
          alignment: Alignment.center, // Alineación centrada
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'AQUI DEBERIAN IR LAS JUSTIFICACIONES',
                style: TextStyle(fontSize: 24 ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFAD0837)),
                ),
                child: Text('Regresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
