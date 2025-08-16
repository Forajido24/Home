import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';


class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Miembros',
                style: TextStyle(color: Color.fromARGB(255, 128, 125, 125), fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
/* 
class Cuartos extends StatelessWidget {
  const Cuartos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(29),
      child: Column(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 244, 245, 245),
              image: DecorationImage(
                image: AssetImage('assets/images/room.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(17), //Solo se redondean las esquinas de arriba
              ),
            ),
          ),
          Container(
            width: 140,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFFCBCECE),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(17), //Solo se redondean las esquinas de abajo
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/

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
          colors: [
            Color(0xFFE8DAB2),
            Color(0XFFDD6E42),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const SizedBox(width: 50),
            const Icon(Icons.wb_cloudy,
                size: 48, color: Color.fromARGB(255, 78, 116, 243)),
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
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Barra extends StatefulWidget {
  const Barra({super.key});

  @override
  State<Barra> createState() => _BarraState();
}

class _BarraState extends State<Barra> {
  String selected = 'Cuartos';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFC0D6DF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SegmentedButton<String>(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFFC0D6DF)),
                side: WidgetStateProperty.all(
                    BorderSide(color: Color(0xFFC0D6DF), width: 2)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
              ),
              segments: const [
                ButtonSegment(
                  value: 'Cuartos',
                  label: Text(
                    'Cuartos',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ButtonSegment(
                  value: 'Dispositivos',
                  label: Text(
                    'Dispositivos',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              selected: {selected},
              onSelectionChanged: (newSelection) {
                setState(() {
                  selected = newSelection.first;
                });
              },
            ),
          ),
        ),
        // Contenido dinámico según la selección
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            selected == 'Cuartos'
                ? 'Contenido de Cuartos'
                : 'Contenido de Dispositivos',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}