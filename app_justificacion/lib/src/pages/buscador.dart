import 'package:flutter/material.dart';

import 'formAlumno.dart';
import 'otros.dart';


class BuscadorPage extends StatelessWidget {
  void _onSearch(String query) {
    // Lógica de búsqueda
    print('Buscar: $query');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              TextField(
                onChanged: _onSearch,
                decoration: InputDecoration(
                  labelText: 'Buscar',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search), // Icono de búsqueda
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtrosPage()),
                      );
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFAD0837)), // Color rojo
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CrearPage()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFAD0837)), // Color rojo
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
