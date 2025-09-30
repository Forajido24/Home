// lib/services/auth_service_login.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../routes/file_routes.dart';

class AuthService {
  static Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
   

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      //print("Logueado como: ${userCredential.user?.email}");
      //ScaffoldMessenger.of(context).showSnackBar(
       // const SnackBar(content: Text('Inicio de sesión exitoso')),
      //);

      Navigator.pushReplacementNamed(context, FileRoutes.home);
    } on FirebaseAuthException catch (e) {
  String message;

  switch (e.code) {
    case 'invalid-email':
      message = 'El correo electrónico no es válido.';
      break;
    case 'user-not-found':
      message = 'No existe una cuenta con este correo.';
      break;
    case 'wrong-password':
      message = 'La contraseña es incorrecta.';
      break;
    case 'user-disabled':
      message = 'La cuenta ha sido deshabilitada.';
      break;
    case 'too-many-requests':
      message = 'Demasiados intentos. Intenta más tarde.';
      break;
    case 'network-request-failed':
      message = 'Sin conexión. Revisa tu conexión a internet.';
      break;
    case 'invalid-credential':
      message = 'Las credenciales no son válidas o han expirado.';
      break;
    default:
      message = 'Error de inicio de sesión: ${e.message}';
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
  }
}
