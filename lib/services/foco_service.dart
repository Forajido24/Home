import 'package:http/http.dart' as http;
import '../config/env.dart';

class FocoService {
  final String baseUrl = Env.focoBaseUrl;

  /// Cambia el estado del foco (true = encender, false = apagar)
  Future<void> cambiarEstado(bool encender) async {
    final endpoint = encender ? 'turn_on' : 'turn_off';
    final url = Uri.parse('$baseUrl/$endpoint');

    try {
      final response = await http.post(url);

      if (response.statusCode == 200) {
        //print(encender ? '💡 Foco encendido correctamente' : '💤 Foco apagado correctamente');
      } else {
        throw Exception('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error al conectar con el foco: $e');
    }
  }
}
