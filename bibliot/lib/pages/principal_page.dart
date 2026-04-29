import 'package:bibliot/components/welcome_card.dart';
import 'package:bibliot/models/book_model.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  final livros = [
   Book(
    title: 'Title agduyfiuysdiss', 
    author: 'Autor test', 
    descripition: 'hssssssssssssss', 
    image: 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTIwfj4ua1yLSLbK7PHX4RG75__H57HEa1nWRDE7x3ZEBypTouXbkbIp15kjPw5tyuxsazPbSwYqNRufHUNYxTcIq_3dcCcN8Vs-aR0w9mmKgN9QmUTBfMj4A'

   ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                WelcomeCard(),
                //Modificar depois
               SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Continue lendo'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox( width: 10),
                        Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox( width: 10),
                        Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                        ),
                       
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Continue lendo'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox( width: 10),
                        Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox( width: 10),
                        Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                        ),
                       
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Continue lendo'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox( width: 10),
                        Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox( width: 10),
                        Container(
                          color: Colors.blue,
                          height: 100,
                          width: 100,
                        ),
                      
                      ],
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
  
    );
  }
}