

import 'package:flutter/material.dart';
import 'package:hestek_v01/screens/home_screen.dart';
import 'package:hestek_v01/screens/login_screen.dart';
import 'package:hestek_v01/screens/register_screen.dart';
import 'package:hestek_v01/screens/splash.dart';

class FileRoutes {
  static const splash ="/";
  static const login = "/login";
  static const register = "/register";
  static const home= "/home";

  static Map<String, WidgetBuilder> routes={
    splash: (context)=> Splash(),
    login: (context)=> LoginScreen(),
    register: (context)=> RegisterScreen(),
    home: (context)=> Inicio()
  };
}