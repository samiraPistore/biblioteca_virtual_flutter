import 'package:flutter/material.dart';
import '../models/book_model.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Book> _favorites = [];

  List<Book> get favorites => _favorites;

  void toggleFavorite(Book book) {
    if (_favorites.contains(book)) {
      _favorites.remove(book);
    } else {
      _favorites.add(book);
    }
    notifyListeners();
  }

  bool isFavorite(Book book) {
    return _favorites.contains(book);
  }
}