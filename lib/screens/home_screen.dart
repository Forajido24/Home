import 'package:flutter/material.dart';
import '../widgets/clima.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        toolbarHeight: 100,
        title: Text("Casa", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
      ),
      body: Column(children: const [Avatar(), Clima(), Barra()],),
      bottomNavigationBar: BottomAppBar(
      color: Color(0xFFEAEAEA),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Alineación a la izquierda
        children: [
          Icon(Icons.menu, size: 30, color: Color(0xFF4F6D7A)), // Ícono dentro del BottomAppBar
        ],
      ),
    ),
    );
  }
}



