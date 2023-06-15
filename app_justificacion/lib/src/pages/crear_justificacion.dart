import 'package:flutter/material.dart';

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  String? _motivoSeleccionado; // Variable para almacenar el motivo seleccionado
  List<String> _motivos = [ // Lista de motivos
    'Familiares',
    'Personal',
    'Salud',
    'Academicos',
    'Deportivos',
    'Otro'
  ];

  // Controladores de texto para cada campo
  TextEditingController _noControlController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _fechaController = TextEditingController();
  TextEditingController _fecha_Final_Controller = TextEditingController();
  TextEditingController _semestreController = TextEditingController();
  TextEditingController _especialidadController = TextEditingController();
  TextEditingController _grupoController = TextEditingController();
  TextEditingController _otroMotivoController = TextEditingController();

  @override
  void dispose() {
    // Liberar los controladores de texto cuando se destruye el widget
    _noControlController.dispose();
    _nombreController.dispose();
    _fechaController.dispose();
    _fecha_Final_Controller.dispose();
    _semestreController.dispose();
    _especialidadController.dispose();
    _grupoController.dispose();
    _otroMotivoController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Lógica para guardar los datos del formulario
    String noControl = _noControlController.text;
    String nombre = _nombreController.text;
    String fecha = _fechaController.text;
    String fechaFinal = _fecha_Final_Controller.text;
    String semestre = _semestreController.text;
    String especialidad = _especialidadController.text;
    String grupo = _grupoController.text;
    String motivo = _motivoSeleccionado!;
    String otroMotivo = _otroMotivoController.text;

    // Imprimir los datos en la consola
    print('No.Control: $noControl');
    print('Nombre del alumno: $nombre');
    print('Fecha: $fecha');
    print('Fecha Final: $fechaFinal');
    print('Semestre: $semestre');
    print('Especialidad: $especialidad');
    print('Grupo: $grupo');
    print('Motivo: $motivo');
    print('Otro Motivo: $otroMotivo');
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
              // Campo de texto para el número de control
              TextFormField(
                controller: _noControlController,
                decoration: InputDecoration(
                  labelText: 'No. Control',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Color(0xFFAD0837)),
                  ),
                ),
              ),
              Divider(),
              // Campo de texto para el nombre del alumno
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre del alumno',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Color(0xFFAD0837)),
                  ),
                ),
              ),
              Divider(),
              // Campo de texto para la fecha
              TextFormField(
                controller: _fechaController,
                decoration: InputDecoration(
                  labelText: 'Fecha',
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Color(0xFFAD0837)),
                  ),
                ),
              ),
              Divider(),
              // Campo de texto para la fecha final
              TextFormField(
                controller: _fecha_Final_Controller,
                decoration: InputDecoration(
                  labelText: 'Fecha Final',
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Color(0xFFAD0837)),
                  ),
                ),
              ),
              Divider(),
              // Campo de texto para el semestre
              TextFormField(
                controller: _semestreController,
                decoration: InputDecoration(
                  labelText: 'Semestre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Color(0xFFAD0837)),
                  ),
                ),
              ),
              Divider(),
              // Campo de texto para la especialidad
              TextFormField(
                controller: _especialidadController,
                decoration: InputDecoration(
                  labelText: 'Especialidad',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Color(0xFFAD0837)),
                  ),
                ),
              ),
              Divider(),
              // Campo de texto para el grupo
              TextFormField(
                controller: _grupoController,
                decoration: InputDecoration(
                  labelText: 'Grupo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Color(0xFFAD0837)),
                  ),
                ),
              ),
              Divider(),
              // Dropdown para seleccionar el motivo
              DropdownButtonFormField(
                value: _motivoSeleccionado,
                onChanged: (value) {
                  setState(() {
                    _motivoSeleccionado = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Motivo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color:Color(0xFFAD0837)),
                  ),
                ),
                items: _motivos.map((motivo) {
                  return DropdownMenuItem(
                    value: motivo,
                    child: Text(motivo),
                  );
                }).toList(),
              ),
              if (_motivoSeleccionado == 'Otro')
                // Campo de texto para especificar otro motivo (visible solo si se selecciona 'Otro')
                TextFormField(
                  controller: _otroMotivoController,
                  decoration: InputDecoration(
                    labelText: 'Especificar otro motivo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide(color: Color(0xFFAD0837)),
                    ),
                  ),
                ),
              SizedBox(height: 16),
              // Botón para generar (enviar) el formulario
              ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFFAD0837)), // Color rojo
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
      focusColor: Color(0xFFAD0837),
    ),
    home: FormularioPage(),
  ));
}
