import 'package:flutter/material.dart';

class Barfocos extends StatefulWidget {
  const Barfocos({super.key});

  @override
  State<Barfocos> createState() => _FocoState();
}

class _FocoState extends State<Barfocos> {
  bool isOn = false; // Estado: foco encendido o apagado

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // Detectar swipe: mover de derecha a izquierda o viceversa
        if (details.delta.dx > 0) {
          // Swipe a la derecha
          setState(() => isOn = true);
        } else if (details.delta.dx < 0) {
          // Swipe a la izquierda
          setState(() => isOn = false);
        }
      },
      child: Container(
        margin: EdgeInsets.all(50),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC0D6DF),
              Color(0xFF4F6D7A),
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
        child: Stack(
          children: [
            // Icono del foco
            Positioned(
              left: 20,
              top: 16,
              child: Icon(
                Icons.lightbulb,
                size: 48,
                color: isOn ? Colors.yellow : Colors.grey[400],
              ),
            ),

            // Texto
            Positioned(
              left: 90,
              top: 26,
              child: Text(
                isOn ? "Encendido" : "Apagado",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Círculo deslizante
            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              right: isOn ? 10 : null,
              left: isOn ? null : 10,
              top: 10,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  // 👇 Aquí va el degradado
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFA9DCF2), 
                      Color(0xFF00B2FF), 
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Agregar extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;

  const Agregar({
    super.key,
    this.size = 60,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight, // esquina inferior derecha
      child: Padding(
        padding: const EdgeInsets.all(40), // margen desde bordes
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF00B2FF),
                  Color(0xFF00B2FF),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: size * 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

