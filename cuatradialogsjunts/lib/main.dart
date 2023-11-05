import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ver cuatro tipos de dialogo',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muestra cuatro tipos de dialogo - Edwin Gallardo',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          FloatingActionButton(
            onPressed: () {
              showDialog(

                  context: context,
                  barrierDismissible: false, //sirve para obligar al usuario o no a elegir una de las opciones del dialogo
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('Elegir Opcion'),
                      children: [
                        SimpleDialogOption(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: const Text('Opcion 1'),
                        ),
                        SimpleDialogOption(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: const Text('Opcion 2'),
                        ),
                        SimpleDialogOption(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text(myController.text),
                        ),
                      ],

                    );
                  });
            },
            tooltip: 'Mostra un dialogo simple!',
            child: const Icon(Icons.text_fields,
              color: Colors.redAccent,),
            backgroundColor: Colors.deepPurpleAccent,),


          FloatingActionButton(
            backgroundColor: Colors.lime,
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Warning'),
                    content: Text(myController.text),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cerrar/Ok'),
                      ),
                    ],
                  );
                },
              );
            },
            tooltip: 'Mostrar un dialogo de alerta!',
            child: const Icon(Icons.text_fields, color: Colors.purple),
          ),


          FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color.alphaBlend(Colors.redAccent, Colors.greenAccent),
                  content: Text('Esto es un SnackBar ' + ' esto es el texto ingresado: ' + myController.text),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            tooltip: 'Mostrar una SnackBar!',
            child: const Icon(Icons.text_fields),
          ),

          FloatingActionButton(
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
                color: Colors.orange // Modifica el color de las letras del botón flotante
            ),
          ),


        ],
      ),
    );
  }
}