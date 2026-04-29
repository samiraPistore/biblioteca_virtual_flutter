import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3D7C2),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      padding: EdgeInsets.all(20),
      width: 500,
      height: 100,

      child: Text(
        'Bem vindo, user123! \nPronto para sua próxima leitura?',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
