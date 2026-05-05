
import 'package:bibliot/models/book_model.dart';
import 'package:flutter/material.dart';


class FavoritesPage extends StatelessWidget {
  final List<Book> favoriteBooks;

  const FavoritesPage(this.favoriteBooks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meus Favoritos',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: favoriteBooks.isEmpty
      ?Center(
        child: Text('Nenhum favorito ainda')
      )
    : ListView.builder(
      itemCount: favoriteBooks.length,
      itemBuilder: (ctx, index) {
        final book = favoriteBooks[index];

        return ListTile(
          title: Text(book.title),
        );
      },
    ),
    );
   
  }
}