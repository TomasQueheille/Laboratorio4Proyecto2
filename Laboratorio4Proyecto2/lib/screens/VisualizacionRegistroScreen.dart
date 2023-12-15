import 'package:flutter/material.dart';

class VisualizacionRegistroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? registro =
        ModalRoute.of(context)?.settings.arguments as String?;

    if (registro != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Visualización de Registro'),
        ),
        body: Center(
          child: Text('Detalles de $registro'),
        ),
      );
    } else {
      // Manejar el caso en el que el argumento sea nulo
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('No se encontraron detalles del registro'),
        ),
      );
    }
  }
}