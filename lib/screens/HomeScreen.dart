import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:laboratorio4proyecto2/screens/cities_weather.dart';

class HomeScreen extends StatelessWidget {
  final Function() toggleTheme;

  HomeScreen({required this.toggleTheme});

  late List<Map<String, dynamic>> citiesWeather = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Lógica para realizar una búsqueda
            },
          ),
          IconButton(
            icon: Icon(Icons.palette),
            onPressed: () {
              toggleTheme();
            },
          ),
        ],
      ),
      body: citiesweather_item.isEmpty
          ? ListView.builder(
              itemCount: citiesweather_item.length,
              itemBuilder: (context, index) {
                return _buildCityCard(context, citiesweather_item[index]);
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _buildCityCard(BuildContext context, CitiesWeather cityWeather) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(cityWeather.image),
        ),
        title: Text(cityWeather.city),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Temperature: ${cityWeather.temperature}'),
            Text('Weather: ${cityWeather.weather}'),
            Text('Description: ${cityWeather.description}'),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/lista_registros',
            arguments: cityWeather.city,
          );
        },
      ),
    );
  }
}





