import 'dart:convert';

import 'package:frontend/services/api_service.dart';
import 'package:http/http.dart' as http;

class ChatDatasource {
  Future<String> fetchAnswer(String text) async {
    final response = await http.post(
      Uri.parse('$baseUrl/question'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": text}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['answear'];
    } else {
      throw Exception("Gagal mengambil jawaban dari server");
    }
  }
}
