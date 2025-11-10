import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import '../widgets/focos.dart';
//import '../widgets/agregar_foco.dart';

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
              color: const Color(0xFFC0D6DF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SegmentedButton<String>(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color(0xFFC0D6DF),
                ),
                side: WidgetStateProperty.all(
                  const BorderSide(color: Color(0xFFC0D6DF), width: 2),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
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
          padding:  EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                selected == 'Cuartos'
                    ? 'Contenido de Cuartos'
                    : 'Control de Dispositivos',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Solo muestra el botón si se selecciona "Dispositivos"
              if (selected == 'Dispositivos') ...[
              
                Barfocos(),
                Agregar()
              ],
            ],
          ),
        ),
        
      ],
    );
  }
}
