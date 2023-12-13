import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  final Function() toggleTheme;

  HomeScreen({required this.toggleTheme});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Map<String, dynamic>> citiesWeather = [];

  @override
  void initState() {
    super.initState();
    loadCitiesWeather();
  }

  Future<void> loadCitiesWeather() async {
    try {
      String data =
          await rootBundle.loadString('assets/data/cities_weather.json');
      List<dynamic> jsonResponse = json.decode(data);
      setState(() {
        citiesWeather =
            jsonResponse.map((dynamic item) => item as Map<String, dynamic>).toList();
      });
    } catch (e) {
      // Manejar errores si ocurre alguno al cargar los datos
      print("Error cargando los datos: $e");
    }
  }

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
              widget.toggleTheme();
            },
          ),
        ],
      ),
      body: citiesWeather.isNotEmpty
          ? ListView.builder(
              itemCount: citiesWeather.length,
              itemBuilder: (context, index) {
                return _buildCityCard(context, citiesWeather[index]);
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _buildCityCard(BuildContext context, Map<String, dynamic> cityWeather) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(cityWeather['image']),
        ),
        title: Text(cityWeather['city']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Temperature: ${cityWeather['temperature']}'),
            Text('Weather: ${cityWeather['weather']}'),
            Text('Description: ${cityWeather['description']}'),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/lista_registros',
            arguments: cityWeather['city'],
          );
        },
      ),
    );
  }
}





