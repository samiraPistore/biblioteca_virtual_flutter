import 'package:bibliot/providers/favorites.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';


class FavoritesPage extends StatelessWidget {

  
  const FavoritesPage({super.key});

@override
Widget build(BuildContext context) {
  final favorites = Provider.of<FavoritesProvider>(context).favorites;
  

  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Meus Favoritos',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    ),
    body: favorites.isEmpty
        ? const Center(
            child: Text('Nenhum favorito ainda'),
          )
        : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (ctx, index) {
              final book = favorites[index];

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 120,
                child: ListTile(
                  minVerticalPadding: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Define o raio do arredondamento
                  ),
                  tileColor: Color(0xFFF3D7C2),
                  leading: Image.network(
                    book.image,
                    ),
                  title: Text(book.title, style: TextStyle(color: Color(0xFFF122F51)),),
                  subtitle: Text(book.author, style: TextStyle(color: Color.fromARGB(255, 16, 23, 31)),),
                ),
              );
              
            },
          ),
  );
}
   
  }