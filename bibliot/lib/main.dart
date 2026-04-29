import 'package:bibliot/pages/home_page.dart';
import 'package:bibliot/pages/login_page.dart';
import 'package:bibliot/utils/app.routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bibliot());
}

class Bibliot extends StatelessWidget {
  const Bibliot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bibliot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
           seedColor:  Color(0xFF17A7A8),
           primary: Color(0xFF17A7A8), 
        ),
         appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF17A7A8),
          foregroundColor: Colors.white,
        ),
  
      ),
       routes: {
        AppRoutes.login: (ctx) => LoginPage(),
        AppRoutes.home: (ctx) => HomePage(),
       }
    );
  }
}