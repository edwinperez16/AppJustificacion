import 'package:flutter/material.dart';

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  String? _motivoSeleccionado;
  List<String> _motivos = [
    'Enfermedad',
    'Muerte',
    'No se cual otra',
  ];

  TextEditingController _noControlController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _fechaController = TextEditingController();
  TextEditingController _semestreController = TextEditingController();
  TextEditingController _especialidadController = TextEditingController();
  TextEditingController _grupoController = TextEditingController();

  @override
  void dispose() {
    _noControlController.dispose();
    _nombreController.dispose();
    _fechaController.dispose();
    _semestreController.dispose();
    _especialidadController.dispose();
    _grupoController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Lógica para guardar los datos del formulario
    String noControl = _noControlController.text;
    String nombre = _nombreController.text;
    String fecha = _fechaController.text;
    String semestre = _semestreController.text;
    String especialidad = _especialidadController.text;
    String grupo = _grupoController.text;
    String motivo = _motivoSeleccionado!;

    print('No.Control: $noControl');
    print('Nombre del alumno: $nombre');
    print('Fecha: $fecha');
    print('Semestre: $semestre');
    print('Especialidad: $especialidad');
    print('Grupo: $grupo');
    print('Motivo: $motivo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
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
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                 ),
              ),
            ),
            Divider(),
            TextFormField(
              controller: _fechaController,
              decoration: InputDecoration(
                labelText: 'Fecha',
                suffixIcon: Icon(Icons.calendar_today),
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
              controller: _grupoController,
              decoration: InputDecoration(
                labelText: 'Grupo',
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                 ),
              ),
            ),
            Divider(),
            DropdownButtonFormField(
              value: _motivoSeleccionado,
              onChanged: (value) {
                setState(() {
                  _motivoSeleccionado = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Motivo',
                 border: OutlineInputBorder( // Utiliza OutlineInputBorder para bordes con esquinas redondeadas
                borderRadius: BorderRadius.circular(18.0),
                
                 ),
              ),
              items: _motivos.map((motivo) {
                return DropdownMenuItem(
                  value: motivo,
                  child: Text(motivo),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
               style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFAD0837)), // Color rojo
                ),
              child: Text('Generar'),
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
    home: FormularioPage(),
  ));
}
