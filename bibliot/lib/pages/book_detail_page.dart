import 'package:bibliot/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Fundo
              Container(
                height: 300,
                width: double.infinity,
                color: const Color.fromARGB(255, 74, 73, 73),
              ),

              // Topo (voltar / share)
              Positioned(
                top: 40,
                left: 10,
                right: 10,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share, color: Colors.white),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 20,
                left: 40,
                right: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190,
                      width: 140,
                      child: Image.network(book.image, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            book.author,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Começar a ler',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF17A7A8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
       
          Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
             child: Text(book.descripition),
            ),
          ), 

        ],
      ), // Botão favorito
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFE958F),
        child: Icon(
          Icons.star_border,
          color: Colors.black, // Define a cor
          size: 40.0, // Define o tamanho
        ),
        onPressed: () {},
      ),
    );
  }
}
