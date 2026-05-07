import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('user');

    final userName = box.get("name") ?? "Usuário";

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3D7C2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Boas vindas, $userName! ',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF122F51),
              ),
            ),
            Text(
              'Preparado(a) para sua próxima leitura?',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF122F51),
              ),
            ),
          ],
        ),
      ),
    );
  }
}