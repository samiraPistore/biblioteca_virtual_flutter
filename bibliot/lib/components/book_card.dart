import 'package:bibliot/models/book_model.dart';
import 'package:bibliot/utils/app.routes.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final Function onTap;
  const BookCard( {super.key, required this.onTap, required  this.book});
   
   void _selectBook(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.bookDetail,
      arguments: book,
    ).then((result){
      if(result == null){
        print('Sem resultado');
      }else{
        print('O nome do livro é $result.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectBook(context),
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
      
              book.image,
              width: 100,
              height: 140,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis, //cortar texto caso seja muito longo 
            ),
            Text(
              book.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, //cortar texto caso seja muito longo 
            ),
          ],
        ),
      ),

    );
  }
}