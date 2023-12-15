import 'package:flutter/material.dart';
import 'package:laboratorio4proyecto2/screens/CityRecord.dart';

class ListaRegistrosScreen extends StatelessWidget {
  final String? cityName;

  const ListaRegistrosScreen({super.key, this.cityName});
  @override
  Widget build(BuildContext context) {
    
    final registros = cityName=='New York' ? Registros.getNewYorkRegistros()
    : Registros.getLondresRegistros(); 
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Registros de $cityName'),
      ),
      body: ListView.builder(
        itemCount: registros.length, // Ejemplo: Número de registros
        itemBuilder: (context, index) {
          final registro = registros[index];
          return ListTile(
            leading: Registros.getIcon(registro.weatherDescription),
            title: Text("${registro.temperature}º"),
            subtitle: Text(registro.weatherDescription),
            onTap: () {
              Navigator.pushNamed(context, '/visualizacion_registro',
                  arguments: registro);
            },
          );
        },
      ),
    );
  }
}