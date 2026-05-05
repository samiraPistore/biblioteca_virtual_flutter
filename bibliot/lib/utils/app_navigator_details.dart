import 'package:flutter/material.dart';
import 'package:bibliot/models/book_model.dart';
import 'package:bibliot/pages/book_detail_page.dart';

void openBookDetail(BuildContext context, Book book) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => BookDetailPage(book),
    ),
  );
}