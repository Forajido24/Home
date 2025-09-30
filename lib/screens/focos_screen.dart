import 'package:flutter/material.dart';
import '../widgets/focos.dart'; //Pendiente

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
      home: const Focos(),
    );
  }
}

class Focos extends StatelessWidget {
  const Focos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      appBar: AppBar(
        backgroundColor: Color(0xFFEAEAEA),
        toolbarHeight: 100,
        title: Text("Cuarto", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
      ),
      body: Column(children: const [Barfocos(), Agregar()],
      ),
    );
  }
}
