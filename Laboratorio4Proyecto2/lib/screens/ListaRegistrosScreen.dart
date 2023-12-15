import 'package:flutter/material.dart';

class ListaRegistrosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? cityName =
        ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registros de $cityName'),
      ),
      body: ListView.builder(
        itemCount: 10, // Ejemplo: Número de registros
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('$cityName - Registro $index'),
            onTap: () {
              Navigator.pushNamed(context, '/visualizacion_registro',
                  arguments: '$cityName - Registro $index');
            },
          );
        },
      ),
    );
  }
}
