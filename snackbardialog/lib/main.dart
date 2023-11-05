import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SnackBar',  // Título de la aplicación
      home: MyCustomForm(),  // Pantalla de inicio de la aplicación
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();  // Controlador para el campo de entrada de texto

  @override
  void dispose() {
    myController.dispose();  // Liberar recursos al cerrar la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muestra SnackBar - Edwin Gallardo',  // Título de la barra de aplicación
            style: TextStyle(color: Colors.white)),  // Estilo del texto del título
        backgroundColor: Colors.teal,  // Color de fondo de la barra de aplicación
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Espaciado alrededor del campo de entrada
        child: TextField(
          controller: myController,  // Asociar el controlador al campo de entrada de texto
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,  // Color de fondo del botón flotante
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color.alphaBlend(Colors.redAccent, Colors.greenAccent),  // Color de fondo del SnackBar
              content: Text('Esto es un SnackBar' + ' junto con el texto ingresado: ' + myController.text),  // Contenido del SnackBar
              duration: Duration(seconds: 3),  // Duración de visualización del SnackBar
            ),
          );
        },
        tooltip: 'Mostrar el SnackBar!',  // Texto que aparece al pasar el cursor sobre el botón flotante
        child: const Icon(Icons.text_fields),  // Icono en el botón flotante
      ),
    );
  }
}
