import 'package:flutter/material.dart';  // Importación de la biblioteca de Flutter

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Muestra simple dialog',  // Título de la aplicación
      home: MyCustomForm(),  // Define la pantalla de inicio como MyCustomForm
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
    myController.dispose();  // Libera los recursos cuando se cierra la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muestra simple dialog - Edwin Gallardo', style: TextStyle(color: Colors.purple),),  // Título de la barra de aplicación
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,  // Asigna el controlador al campo de entrada de texto
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,  // Sirve para obligar al usuario o no a elegir una de las opciones del diálogo
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: const Text('Elegir Opcion'),  // Título del diálogo
                  children: [
                    SimpleDialogOption(
                      onPressed: (){
                        Navigator.of(context).pop();  // Cierra el diálogo
                      },
                      child: const Text('Opcion 1'),  // Opción 1
                    ),
                    SimpleDialogOption(
                      onPressed: (){
                        Navigator.of(context).pop();  // Cierra el diálogo
                      },
                      child: const Text('Opcion 2'),  // Opción 2
                    ),
                    SimpleDialogOption(
                      onPressed: (){
                        Navigator.of(context).pop();  // Cierra el diálogo
                      },
                      child: Text(myController.text),  // Esta línea muestra el texto ingresado en el campo de entrada de texto en el diálogo
                    )
                  ],
                );
              }
          );
        },
        tooltip: 'Mostrar el dialeg!',  // Texto que aparece cuando se pasa el mouse sobre el botón flotante
        child: const Icon(Icons.text_fields, color: Colors.redAccent,),  // Icono en el botón flotante
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
