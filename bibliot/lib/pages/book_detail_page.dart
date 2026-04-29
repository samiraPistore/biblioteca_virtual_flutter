import 'package:bibliot/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key});

  _createSectionTile(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  // Caixa das seções
  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 300,
      height: 250,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final book_i = ModalRoute.of(context)!.settings.arguments as Book;
    return Scaffold(
      appBar: AppBar(
        title: Text(book_i.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Imagem
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(book_i.image, fit: BoxFit.cover),
            ),

            // Passos
           
          ],
        ),
      ),

      // Botão favorito
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,

        child: Icon(Icons.star),

        onPressed: () {},
      ),
    );
  }
}
