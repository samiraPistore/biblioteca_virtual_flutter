/*import 'dart:convert';

import 'package:bibliot/models/book_model.dart';
import 'package:http/http.dart' as http;
class BookService {
  static const String baseUrl = 'http://localhost:3020/books';

  static Future<List<Book>> fetchBooks() async{
    final response = await http.get(
      Uri.parse('$baseUrl/books'),
    );
    if(response.statusCode == 200){
      final List data = jsonDecode(response.body);
      return data.map((e) => Book.fromJson(e)).toList();
    } else{
      throw Exception('Erro ao buscar livros');
    }

  }
}
*/