import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

// Utiliza la API de OpenWeatherMap para obtener datos del clima basado en la ubicación del usuario
class Clima extends StatefulWidget {
  const Clima({super.key});

  @override
  State<Clima> createState() => _ClimaState();
}

// Clase que maneja el estado del widget Clima
class _ClimaState extends State<Clima> {
  final String apiKey = '5dc860a75368d2af54e081aa6524db38'; //API Key
  String ciudad = "Ubicando...";
  String descripcion = "Cargando...";
  double temperatura = 0;

  // Inicializa el estado del widget y obtiene la ubicación y el clima al iniciar
  @override
  void initState() {
    super.initState();
    obtenerUbicacionYClima();
  }

  // Método para obtener la ubicación actual y el clima
  // Verifica si el servicio de ubicación está activo y si se tienen los permisos necesarios
  Future<void> obtenerUbicacionYClima() async {
    bool servicioActivo = await Geolocator.isLocationServiceEnabled();
    if (!servicioActivo) {
      setState(() {
        ciudad = "Ubicación desactivada";
        descripcion = "Activa el GPS";
      });
      return;
    }
    // Verifica los permisos de ubicación
    // Si no se tienen permisos, solicita al usuario que los otorgue
    LocationPermission permiso = await Geolocator.checkPermission();
    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission();
      if (permiso == LocationPermission.denied) return;
    }
    if (permiso == LocationPermission.deniedForever) return;
    // Obtiene la posición actual del usuario
    Position posicion = await Geolocator.getCurrentPosition();
    // Construye la URL para la API de OpenWeatherMap con la latitud y longitud obtenidas
    // Utiliza la API Key y especifica las unidades en métricas y el idioma en
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${posicion.latitude}&lon=${posicion.longitude}&appid=$apiKey&units=metric&lang=es',
    );
    // Realiza la solicitud HTTP a la API
    // Si la respuesta es exitosa, decodifica los datos JSON y actualiza el estado del widget
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      final datos = json.decode(respuesta.body);
      setState(() {
        ciudad = datos['name'];
        descripcion = datos['weather'][0]['description'];
        temperatura = datos['main']['temp'];
      });
    } else {
      setState(() {
        ciudad = "Error";
        descripcion = "No se pudo obtener clima";
      });
    }
  }

  // Widget que construye la interfaz del clima
  // Muestra la ciudad, descripción del clima y temperatura en un contenedor estilizado
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE8DAB2), Color(0XFFDD6E42)],
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const SizedBox(width: 15),
            const Icon(
              Icons.wb_cloudy,
              size: 48,
              color: Color.fromARGB(255, 78, 116, 243),
            ),
            const SizedBox(width: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ciudad,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "$descripcion · ${temperatura.toStringAsFixed(1)}°C",
                  style: const TextStyle(fontSize: 10, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

