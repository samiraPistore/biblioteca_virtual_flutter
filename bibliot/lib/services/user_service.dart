import 'dart:convert';
import 'package:bibliot/models/user_modal.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = 'http://10.0.2.2:3020';
  static Future<dynamic> login(String email, String senha) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'senha': senha}),
    );

    if (response.statusCode != 200) {
      throw Exception('Login inválido');
    }

    return jsonDecode(response.body);
  }

  static Future<dynamic> register(
    String name,
    String email,
    String senha,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'senha': senha}),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Erro ao cadastrar');
    }

    return jsonDecode(response.body);
  }

  //Função pegar o user
  static Future<List<Users>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
    ); //faz a requisição

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Users.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar user');
    }
  }
}
