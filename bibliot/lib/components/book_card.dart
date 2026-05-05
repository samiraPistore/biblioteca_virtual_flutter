import 'package:bibliot/models/book_model.dart';
import 'package:bibliot/utils/app_navigator_details.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard( {super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    //inkWell dá efeito de clique para elementos não clicavéis
    return InkWell(
      onTap: () => openBookDetail(context, book),
      child: Card(
        elevation: 4,
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Image.network(
                book.image,
                width: 100,
                height: 140,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5),
              Text(
                book.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, //cortar o texto que ultrapassa o limite de largura disponível 
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // autor
              Text(
                book.author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, //cortar o texto que ultrapassa o limite de largura disponível 
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
