import 'package:flutter/material.dart';  // Importación de la biblioteca de Flutter

void main() {
  // runApp es una función que inicia la aplicación Flutter
  // MaterialApp es un widget que proporciona algunas configuraciones básicas para la aplicación
  return runApp(MaterialApp(
    // El widget MaterialApp contiene el widget Scaffold, que proporciona la estructura basica de la pagina
    home: Scaffold(
      appBar: AppBar(
        title: const Text("hello, World!"),  // Barra de aplicación con un título
      ),
      body: const Center(
        child: Text(
          "Edwin Gallardo Alvarez",  // Texto que se muestra en el centro de la pantalla
          style: TextStyle(
            fontSize: 24,  // Tamaño de fuente 24
            color: Colors.blue,  // Color del texto, en este caso, azul
          ),
        ),
      ),
    ),
  ));
}
