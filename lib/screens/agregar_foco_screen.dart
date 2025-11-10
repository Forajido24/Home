import 'package:flutter/material.dart';
//import 'home_screen.dart';
//import '../services/auth_service_register.dart';
//+import '../routes/file_routes.dart';

class AgregarScreen extends StatefulWidget {
  const AgregarScreen({super.key});

  @override
  State<AgregarScreen> createState() => _AgregarScreenState();
}

class _AgregarScreenState extends State<AgregarScreen> {
  //final usernameController = TextEditingController();
  final focoIpController = TextEditingController();
  final nombreController = TextEditingController();
  final estadoController = TextEditingController();

  void _registerFoco() {
    if (
      //usernameController.text.isNotEmpty &&
        focoIpController.text.isNotEmpty &&
        nombreController.text.isNotEmpty &&
        estadoController.text.isNotEmpty) {
      //agregar funcion
    } else {
      //agregar funcion
    }
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
              Image.asset('assets/agregar_foco.png', height: 240, width: 240),
              const SizedBox(height: 20),
              //buildTextField(label: 'User', controller: usernameController),
              buildTextField(label: 'IP del foco', controller: focoIpController),
              buildTextField(
                label: 'Nombre o Alias del foco',
                controller: nombreController,
                isPassword: true,
              ),
              buildTextField(
                label: 'Estado del foco',
                controller: estadoController,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _registerFoco,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00B2FF),
                    foregroundColor: const Color(0xFFEAEAEA),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Agregar dispositivo'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
