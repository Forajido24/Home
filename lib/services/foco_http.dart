//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FocoControlService {
  bool estadoFoco = false; // false = apagado, true = encendido
  final String FOCO_IP = "http://192.168.100.173/light/kauf_bulb";

  // Función que recibe el estado deseado
  Future<String> cambiarEstado(bool encender) async {
    if (encender) {
      if (estadoFoco) return "💡 El foco ya está encendido";
      try {
        await http.post(Uri.parse("$FOCO_IP/turn_on"));
        estadoFoco = true;
        return "💡 Foco encendido";
      } catch (e) {
        return "Error al encender el foco:\n$e";
      }
    } else {
      if (!estadoFoco) return "💤 El foco ya está apagado";
      try {
        await http.post(Uri.parse("$FOCO_IP/turn_off"));
        estadoFoco = false;
        return "💤 Foco apagado";
      } catch (e) {
        return "Error al apagar el foco:\n$e";
      }
    }
  }
}
