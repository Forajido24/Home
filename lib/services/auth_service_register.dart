// import'lib/services/auth_service_register.dart'
import 'package:firebase_auth/firebase_auth.dart';
//import '../routes/app_routes.dart';
import 'package:flutter/material.dart'; 



class AuthServiceRegistro  {
    static  Future<void> registerUser({
      required BuildContext context,
      required String email,
      required String pass,
      required String confirmPass,

    }) async{

    if (email.isEmpty || pass.isEmpty || confirmPass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Todos los campos son obligatorios")),
      );
      return;
    }

    if (pass != confirmPass) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Las contraseñas no coinciden")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cuenta creada correctamente")),
      );

      //Navigator.pop(context); // ← volver al login
      //Navigator.pushReplacementNamed(context, AppRoutes.login);
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'email-already-in-use':
          message = 'Este correo ya está en uso.';
          break;
        case 'invalid-email':
          message = 'El correo ingresado no es válido.';
          break;
        case 'weak-password':
          message = 'La contraseña es demasiado débil. Usa al menos 6 caracteres.';
          break;
        case 'operation-not-allowed':
          message = 'El registro con correo está deshabilitado.';
          break;
        case 'too-many-requests':
          message = 'Demasiados intentos. Intenta más tarde.';
          break;
        case 'network-request-failed':
          message = 'No tienes conexión a internet.';
          break;
        default:
          message = 'Error al crear cuenta: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

    }
  }