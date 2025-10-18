import 'package:flutter/material.dart';

class Barfocos extends StatefulWidget {
  const Barfocos({super.key});

  @override
  State<Barfocos> createState() => _FocoState();
}

class _FocoState extends State<Barfocos> with SingleTickerProviderStateMixin {
  bool isOn = false; // Estado: foco encendido o apagado
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Animación para el "brillo" del foco
    _glowAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle(bool value) {
    setState(() {
      isOn = value;
      if (isOn) {
        _controller.forward(); // Inicia la animación de brillo
      } else {
        _controller.reverse(); // Apaga el brillo
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          _toggle(true); // Encender
        } else if (details.delta.dx < 0) {
          _toggle(false); // Apagar
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors:
                isOn
                    ? [const Color(0xFF4F6D7A), const Color(0xFF00B2FF)]
                    : [const Color(0xFFB0B0B0), const Color(0xFF707070)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Icono del foco animado
            Positioned(
              left: 20,
              top: 16,
              child: AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return Icon(
                    Icons.lightbulb,
                    size: 48,
                    color:
                        isOn
                            ? Colors.yellow.withOpacity(_glowAnimation.value)
                            : Colors.grey[400],
                  );
                },
              ),
            ),

            // Texto de estado
            Positioned(
              left: 90,
              top: 26,
              child: Text(
                isOn ? "Encendido" : "Apagado",
                style: TextStyle(
                  color: isOn ? Colors.white : Colors.black45,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Círculo deslizante con animación
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              right: isOn ? 10 : null,
              left: isOn ? null : 10,
              top: 10,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors:
                        isOn
                            ? [const Color(0xFFA9DCF2), const Color(0xFF00B2FF)]
                            : [
                              const Color(0xFF808080),
                              const Color(0xFFB0B0B0),
                            ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          isOn
                              ? Colors.blueAccent.withOpacity(0.5)
                              : Colors.black26,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
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

// -------------------------
// Botón flotante de agregar
// -------------------------
class Agregar extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;

  const Agregar({super.key, this.size = 60, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF00B2FF), Color(0xFF00B2FF)],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: const Center(
              child: Icon(Icons.add, color: Colors.white, size: 35),
            ),
          ),
        ),
      ),
    );
  }
}
