import 'package:flutter/material.dart';

class form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Formulario';
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        theme: ThemeData(
        fontFamily: 'ELEGANT TYPEWRITER',
        primarySwatch: Colors.deepPurple , 
      ),
      title: appTitle,
      home: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _apellidos = '';
  String _correo = '';
  DateTime _fechaNacimiento = DateTime(1944, 6, 6);
  String _universidad = '';
  String _carrera = '';
  DateTime _fechaComNacimiento = DateTime(1944, 6, 6);
  String _checker = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Formulario Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nombre = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Apellidos'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, llena el espacio';
                  }
                  return null;
                },
                onSaved: (value) {
                  _apellidos = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Correo'),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Por favor, ingresa un correo válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _correo = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Fecha de Nacimiento'),
                validator: (value) {
                  if ((_fechaNacimiento == ( DateTime(1944, 6, 6)))) {
                    return 'Por favor, ingresa una fecha de nacimiento valida';
                  }
                  return null;
                },
                onTap: () async {
                  DateTime? fechaSeleccionada = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (fechaSeleccionada != null) {
                    setState(() {
                      _fechaNacimiento = fechaSeleccionada;
                      _fechaComNacimiento = _fechaNacimiento;
                     if (_fechaComNacimiento.isAfter(DateTime.now().subtract(const Duration(days: 365 * 18)))){
                          _checker = 'no es mayor de edad';
                     }else{
                      _checker = 'si es mayor de edad';
                     }
                      
                    });
                  }
                },
                readOnly: true,
                controller: TextEditingController(
                  // ignore: unnecessary_null_comparison
                  text: _fechaNacimiento != null
                      ? "${_fechaNacimiento.toLocal()}".split(' ')[0]
                      : '',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Universidad donde estudia'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa la universidad';
                  }
                  return null;
                },
                onSaved: (value) {
                  _universidad = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Carrera'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa la carrera';
                  }
                  return null;
                },
                onSaved: (value) {
                  _carrera = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _mostrarDatos();
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDatos() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Datos Ingresados'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre: $_nombre'),
                Text('Apellidos: $_apellidos'),
                Text('Correo: $_correo'),
                Text('Fecha de Nacimiento: ${_fechaNacimiento.toLocal()}'.split(' ')[0]),
                Text('Universidad donde estudia: $_universidad'),
                Text('Carrera: $_carrera'),
                Text('Comprobador de edad: $_checker'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

