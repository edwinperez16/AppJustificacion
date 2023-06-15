import 'package:flutter/material.dart';

class CrearPage extends StatefulWidget {
  @override
  _CrearPageState createState() => _CrearPageState();
}

class _CrearPageState extends State<CrearPage> {

  TextEditingController _noControlController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _curpController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _semestreController = TextEditingController();
  TextEditingController _especialidadController = TextEditingController();
  TextEditingController _telefonoController = TextEditingController();

  @override
  void dispose() {
    _noControlController.dispose();
    _nombreController.dispose();
    _curpController.dispose();
    _emailController.dispose();
    _semestreController.dispose();
    _especialidadController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }

  

  void _submitForm() {
    // Lógica para guardar los datos del formulario
    String noControl = _noControlController.text;
    String nombre = _nombreController.text;
    String curp = _curpController.text;
    String email = _emailController.text;
    String semestre = _semestreController.text;
    String especialidad = _especialidadController.text;
    String telefono = _telefonoController.text;
    

    print('No.Control: $noControl');
    print('Nombre del alumno: $nombre');
    print('Fecha: $curp');
    print ('fechaFinal: $email');
    print('Semestre: $semestre');
    print('Especialidad: $especialidad');
    print('Grupo: $telefono');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Alumno'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _noControlController,
              decoration: InputDecoration(
                labelText: 'No. Control',
                 suffixIcon: Icon(Icons.contact_mail_outlined),
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                
                 ),

              ),
            ),
            Divider(),
            TextFormField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre del alumno',
                 suffixIcon: Icon(Icons.article_rounded),
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                 ),
              ),
            ),
            Divider(),
            TextFormField(
              controller: _curpController,
              decoration: InputDecoration(
                labelText: 'CURP',
                suffixIcon: Icon(Icons.drive_file_rename_outline_rounded),
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                 ),
              ),
            ),
             Divider(),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo',
                suffixIcon: Icon(Icons.account_box),
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                 ),
              ),
            ),
            Divider(),
            TextFormField(
              controller: _semestreController,
              decoration: InputDecoration(
                labelText: 'Semestre',
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                 ),
              ),
            ),
            Divider(),
            TextFormField(
              controller: _especialidadController,
              decoration: InputDecoration(
                labelText: 'Especialidad',
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                 ),
              ),
              
            ),
            Divider(),
            TextFormField(
              controller: _telefonoController,
              decoration: InputDecoration(
                labelText: 'Telefono',
                 suffixIcon: Icon(Icons.numbers_rounded),
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                 ),
              ),
            ),
            
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
               style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFAD0837)), // Color rojo
                ),
              child: Text('Agregar'),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
    focusColor: Colors.red,
      ),
    home: CrearPage(),
  ));
}
