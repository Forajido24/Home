import'package:flutter/material.dart';
import '../routes/file_routes.dart';

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
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, FileRoutes.agregar),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF00B2FF), Color(0xFF00B2FF)],
              ),
              boxShadow:  [
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