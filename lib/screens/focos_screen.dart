import 'package:flutter/material.dart';
import '../widgets/focos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focos Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FocosScreen(),
    );
  }
}

// Renombré la clase a FocosScreen para evitar colisiones de nombres con otros archivos
class FocosScreen extends StatelessWidget {
  const FocosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAEAEA),
        toolbarHeight: 100,
        elevation: 0,
        title: const Text(
          "Cuarto",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Column(
        // mostrar 3 focos (puedes cambiar a ListView si esperas muchos)
        children: const [
         Barfocos(),
         Agregar(),
        ],
      ),
      // uso de Stack para colocar la lista de focos y el botón flotante
    );
  }
}
