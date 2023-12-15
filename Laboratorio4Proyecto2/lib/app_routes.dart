import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';
import 'screens/ListaRegistrosScreen.dart';
import 'screens/VisualizacionRegistroScreen.dart';
import 'screens/WidgetReutilizableScreen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen(toggleTheme: () {  },));
      case '/lista_registros':
        return MaterialPageRoute(builder: (_) => ListaRegistrosScreen());
      case '/visualizacion_registro':
        return MaterialPageRoute(builder: (_) => VisualizacionRegistroScreen());
      case '/widget_reutilizable':
        return MaterialPageRoute(builder: (_) => WidgetReutilizableScreen());
      default:
        // Manejar rutas desconocidas aquí, por ejemplo, redirigir a una página de error
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text(
                '404 - Page not found',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
    }
  }
}

