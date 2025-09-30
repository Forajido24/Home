import 'package:flutter/material.dart';
import '../routes/file_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, FileRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFEAEAEA), // Fondo claro como en tu imagen
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
          height: 150, // Puedes ajustar este valor si quieres más grande
        ),
      ),
    );
  }
}
