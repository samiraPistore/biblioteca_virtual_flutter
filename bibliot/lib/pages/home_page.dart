import 'package:bibliot/components/search_bar.dart';
import 'package:bibliot/pages/config_page.dart';
import 'package:bibliot/pages/favorites_page.dart';
import 'package:bibliot/pages/principal_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0; // Define o indice da tela escolhida
  final List<Widget> _telas = [
    PrincipalPage(), 
    FavoritesPage(), 
    ConfigPage(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                SearchBarWidget(),
                SizedBox(width: 20,),
                CircleAvatar(),
              ],
            ),
          ),
        ],
      ),

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
