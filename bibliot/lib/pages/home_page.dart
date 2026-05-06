import 'package:bibliot/components/book_sections.dart';
import 'package:bibliot/components/welcome_card.dart';
import 'package:bibliot/data/dummy_data.dart';
import 'package:bibliot/pages/search_page.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  
  // filtrar os livros por gênero
  final terror = dummyBooks.where((b) => b.genre == 'Terror').toList();

  final filosofia = dummyBooks.where((b) => b.genre == 'Filosofia').toList();

  final romance = dummyBooks.where((b) => b.genre == 'Romance').toList();

  final fic_cientifica = dummyBooks.where((b) => b.genre == 'Ficção Científica').toList();

  final aventura = dummyBooks.where((b) => b.genre == 'Aventura').toList();

  final drama = dummyBooks.where((b) => b.genre == 'Drama').toList();

  final misterio = dummyBooks.where((b) => b.genre == 'Mistério').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
                  icon: Icon(Icons.search),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(),
                
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                WelcomeCard(),
                //Modificar depois
                SizedBox(height: 20),

                BookSections(sectionName: 'Terror', books: terror),
                SizedBox(height: 20),
                BookSections(sectionName: 'Romance', books: romance),
                SizedBox(height: 20),
                BookSections(sectionName: 'Aventura', books: aventura),
                SizedBox(height: 20),
                BookSections(sectionName: 'Mistério', books: misterio),
                SizedBox(height: 20),
                BookSections(sectionName: 'Filosofia', books: filosofia),
                SizedBox(height: 20),
                BookSections(
                  sectionName: 'Ficção Científica',
                  books: fic_cientifica,
                ),
                SizedBox(height: 20),
                BookSections(sectionName: 'Drama', books: drama),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
