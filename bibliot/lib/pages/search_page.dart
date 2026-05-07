import 'package:bibliot/components/search_bar.dart';
import 'package:bibliot/data/dummy_data.dart';
import 'package:bibliot/models/book_model.dart';
import 'package:bibliot/utils/app_navigator_details.dart';

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  final List<Book> books = dummyBooks;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final data = books;

    final filtered = data.where((data) {
      final title = data.title.toString().toLowerCase();
      final author = data.author.toString().toLowerCase(); 
      final q = searchQuery.toLowerCase();

      if (q.isEmpty) return false;

      return title.contains(q) ||
          author.contains(q); 
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
           
            Row(  
              mainAxisSize:
                  MainAxisSize.min, //ocupar o minimo de espaço possível
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, //espaço entre os elementos
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: SearchBarWidget(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            //constrói a lista vizualmente dos resultados da pesquisa
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final book = filtered[index];

                  return InkWell(
                   onTap: () => openBookDetail(context, book),

                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        tileColor:Color(0xFFF3D7C2),
                        title: Text(book.title, style: TextStyle(color:  Color(0xFFF122F51)),),
                        leading: Image.network(book.image, width: 50, height: 70, fit: BoxFit.cover),
                        subtitle: Text(book.author, style: TextStyle(color: Color.fromARGB(255, 16, 23, 31)),),
                      ),
                    ),
                      
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
