import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: 500,
                  height: 100,
                  color: Color(0xFFF3D7C2),
                  child: Text(
                    'Bem vindo, user123! \nPronto para sua próxima leitura?',
                    style: TextStyle( 
                      fontSize: 20,
                    ),
                  ),
                ),
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