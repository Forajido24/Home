import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../routes/file_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: FileRoutes.splash,
      routes: FileRoutes.routes
      
    );
  }
}
