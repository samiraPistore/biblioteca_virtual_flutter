import 'package:bibliot/components/book_card.dart';
import 'package:bibliot/models/book_model.dart';
import 'package:flutter/material.dart';

class BookSections extends StatelessWidget {
  final String sectionName;
  final List<Book> books;
  const BookSections({
    super.key,
    required this.sectionName,
    required this.books,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookCard(book: books[index],);
            },
          ),
        ),
      ],
    );
  }
}
