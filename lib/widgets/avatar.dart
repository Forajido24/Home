import 'package:flutter/material.dart';
import 'dart:math';

class Avatar extends StatelessWidget {
  Avatar({super.key});
  final List<String> imagenes = [
    'assets/caballero_foco.jpeg',
    'assets/chambeador_foco.jpeg',
    'assets/bailerina_foco.jpeg',
    'assets/detective_foco.jpeg',
    'assets/nerd_foco.jpeg',
    'assets/super_foco.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final imagenSeleccionada = imagenes[random.nextInt(imagenes.length)];
    return Container(
      margin: EdgeInsets.only(top: 0, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Miembros',
              style: TextStyle(
                color: Color.fromARGB(255, 128, 125, 125),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CircleAvatar(
            radius: 30,
            //backgroundColor: Colors.white,
            backgroundImage: AssetImage(imagenSeleccionada),
          ),
        ],
      ),
    );
  }
}