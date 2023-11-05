import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recuperar el valor d\'un camp de text', // Título de la aplicación
      home: MyCustomForm(), // Pantalla de inicio de la aplicación
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController(); // Controlador para el campo de entrada de texto

  @override
  void dispose() {
    myController.dispose(); // Liberar recursos al cerrar la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text'), // Título de la barra de aplicación
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaciado alrededor del campo de entrada
        child: TextField(
          controller: myController, // Asociar el controlador al campo de entrada de texto
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow, // Modifica el color del botón flotante

        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent, // Modifica el color de fondo del modal bottom sheet
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.pinkAccent, // Modifica el color del diálogo
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(myController.text), // Muestra el texto ingresado en el campo de entrada
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Tancar BottomSheet'), // Texto del botón en el diálogo
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        tooltip: 'Mostra el BottomSheet!', // Texto que aparece al pasar el cursor sobre el botón flotante
        child: const Icon(Icons.text_fields,
            color: Colors.blue // Modifica el color de las letras del botón flotante
        ),
      ),
    );
  }
}
