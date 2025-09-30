import 'package:flutter/material.dart';
//import 'update_password_screen.dart';
import '../services/auth_service_recover.dart';

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final emailController = TextEditingController();

  void _goToUpdatePasswordScreen() {
    if (emailController.text.isNotEmpty) {
     // Navigator.push(
      //  context, 
        //MaterialPageRoute(builder: (context) => const UpdatePasswordScreen()),
      //);
      PasswordRecoveryService.sendRecoveryEmail(context: context, email: emailController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor ingresa tu correo electrónico'),
        ),
      );
    }
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
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
              Image.asset('assets/logo.png', height: 120),
              const SizedBox(height: 20),

              buildTextField(label: 'Email', controller: emailController),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _goToUpdatePasswordScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F6D7A),
                    foregroundColor: const Color(0xFFEAEAEA),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Reestablecer contraseña'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
