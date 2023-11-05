import 'package:flutter/material.dart';  // Importa la biblioteca de Flutter

void main() {
  runApp(MaterialApp(
    // MaterialApp proporciona una estructura básica para la aplicación
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Layouts"),  // Barra de aplicación con un título
        backgroundColor: Color.alphaBlend(Colors.deepPurpleAccent, Colors.deepOrange),  // Color de fondo de la barra de aplicación
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,  // Color de fondo del contenedor
                ),
                child: const Text("one"),  // Texto dentro del contenedor
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,  // Color de fondo del contenedor
                ),
                child: const Text("Two"),  // Texto dentro del contenedor
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,  // Color de fondo del contenedor
                ),
                child: const Text("Three"),  // Texto dentro del contenedor
              ),
            ],
          ),
          const Positioned.fill(
            child: Center(
              child: Text("Edwin Gallardo Alvarez 23-24",
                style: TextStyle(fontSize: 30,  // Tamaño de fuente
                  color: Colors.blue,  // Color del texto
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
