import 'package:bibliot/models/book_model.dart';
import 'package:bibliot/pages/config_page.dart';
import 'package:bibliot/pages/favorites_page.dart';
import 'package:bibliot/pages/home_page.dart';
import 'package:flutter/material.dart';

class TogglePage extends StatefulWidget {
  
  const TogglePage({super.key});

  @override
  State<TogglePage> createState() => _HomePageState();
}

class _HomePageState extends State<TogglePage> {

  int _indiceAtual = 0; // Define o indice da tela escolhida
  List<Widget> get _telas => [PrincipalPage(), FavoritesPage(_favoriteBooks), ConfigPage()];
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

    // lista de livros favoritos
  List<Book> _favoriteBooks = [];
  
  // função para adicionar ou remover um livro dos favoritos
  void _toggleFavorite(Book book) {
  setState(() {
    final isFavorite = _favoriteBooks.contains(book);

    if (isFavorite) {
      _favoriteBooks.remove(book);
    } else {
      _favoriteBooks.add(book);
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.white,
        currentIndex: _indiceAtual,
        onTap: onTabTapped, //chama o método ao clicar nas opções
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }
}
