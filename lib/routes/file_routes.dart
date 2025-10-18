

import 'package:flutter/material.dart';
import 'package:hestek_v01/screens/agregar_foco_screen.dart';
import 'package:hestek_v01/screens/focos_screen.dart';
import 'package:hestek_v01/screens/home_screen.dart';
import 'package:hestek_v01/screens/login_screen.dart';
import 'package:hestek_v01/screens/register_screen.dart';
import 'package:hestek_v01/screens/splash.dart';

class FileRoutes {
  static const splash ="/";
  static const login = "/login";
  static const register = "/register";
  static const home= "/home";
  static const focos= "/focos";
  static const agregar="/agregar";

  static Map<String, WidgetBuilder> routes={
    splash: (context)=> Splash(),
    login: (context)=> LoginScreen(),
    register: (context)=> RegisterScreen(),
    home: (context)=> Inicio(),
    focos: (context)=> FocosScreen(),
    agregar: (context)=> AgregarScreen(),
  };
}