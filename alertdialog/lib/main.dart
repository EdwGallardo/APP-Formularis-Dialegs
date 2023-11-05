import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mostrar diálogo de alerta',  // Título de la aplicación
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
        title: const Text('Muestra Alert Dialog - Edwin Gallardo', style: TextStyle(color: Colors.purple),),  // Título de la barra de aplicación
        backgroundColor: Colors.lime,  // Color de fondo de la barra de aplicación
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,  // Asociar el controlador al campo de entrada de texto
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lime,  // Color de fondo del botón flotante
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,  // Evita que el usuario cierre el diálogo tocando fuera de él
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Warning'),  // Título del diálogo
                content: Text(myController.text),  // Contenido del diálogo, muestra el texto del campo de entrada
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();  // Cierra el diálogo
                    },
                    child: Text('Cerrar/Ok'),  // Texto del botón en el diálogo
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Mostrar el diálogo de alerta',  // Texto que aparece al pasar el cursor sobre el botón flotante
        child: const Icon(Icons.text_fields, color: Colors.purple,),  // Icono en el botón flotante
      ),
    );
  }
}
