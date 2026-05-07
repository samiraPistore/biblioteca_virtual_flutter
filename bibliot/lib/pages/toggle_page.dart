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
  List<Widget> get _telas => [PrincipalPage(), FavoritesPage(), ConfigPage()];
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
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
