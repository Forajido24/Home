import 'package:flutter/material.dart';
//import 'home_screen.dart';
//import 'register_screen.dart';
import 'recover_password_screen.dart';
import '../routes/file_routes.dart';
import '../services/auth_service_login.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _goToHome() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      AuthService.loginUser(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor llena todos los campos')),
      );
    }
  }

  void _goToRegister() {
    Navigator.pushNamed(context, FileRoutes.register);
  }

  void _goToFocos(){
    Navigator.pushNamed(context, FileRoutes.focos);
  }

  void _goToRecoverPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RecoverPasswordScreen()),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFEAEAEA),
          labelText: label,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => controller.clear(),
          ),
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/logo.png', height: 120),
              const SizedBox(height: 20),

              // Campos de texto
              buildTextField(label: 'Email', controller: emailController),
              buildTextField(
                label: 'Password',
                controller: passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 20),

              // Botón Iniciar sesión
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _goToHome,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F6D7A),
                    foregroundColor: const Color(0xFFEAEAEA),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Iniciar sesión'),
                ),
              ),

              const SizedBox(height: 10),

              // Botón Crear cuenta
               

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _goToRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F6D7A),
                    foregroundColor: const Color(0xFFEAEAEA),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Crear cuenta'),
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _goToFocos,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 38, 24, 78),
                    foregroundColor: const Color(0xFFEAEAEA),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Ir a focos'),
                ),
              ),

              const SizedBox(height: 20),

              // Texto: ¿Olvidaste tu contraseña?
              TextButton(
                onPressed: _goToRecoverPassword,
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
