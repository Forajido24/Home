import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../routes/file_routes.dart';

class PasswordRecoveryService {
  static Future<void> sendRecoveryEmail({
    required BuildContext context,
    required String email,
  }) async {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("El correo es obligatorio")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Correo enviado para restablecer la contraseña")),
        
      );
      Navigator.pushReplacementNamed(context, FileRoutes.login);
    } catch (e) {
      //print("Error en recuperación de contraseña: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al enviar el correo")),
      );
      //Navigator.pushReplacementNamed(context, FileRoutes.login);
    }
  }
}
