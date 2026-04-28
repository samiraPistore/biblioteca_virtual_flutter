import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical:20),
          child: Column(
            children: [
              
              Container(
                height: 200,
                color: Color(0xFFF3D7C2),
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color:Colors.yellow,
                    ),
                    Expanded(
                      child: ListTile(
                      
                      title: Text('Título do livro'),
                      subtitle: Text('Autor'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                color: Color(0xFFF3D7C2),
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color:Colors.yellow,
                    ),
                    Expanded(
                      child: ListTile(
                      
                      title: Text('Título do livro'),
                      subtitle: Text('Autor'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                color: Color(0xFFF3D7C2),
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color:Colors.yellow,
                    ),
                    Expanded(
                      child: ListTile(
                      
                      title: Text('Título do livro'),
                      subtitle: Text('Autor'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
      
    );

  }
}