import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ListTile(
        leading: Container( color: Colors.amber,),
        title: Text('Book'),
        subtitle: Text('autor'),
      ),
    );
  }
}