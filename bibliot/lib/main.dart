import 'package:bibliot/pages/resgister_page.dart';
import 'package:bibliot/pages/toggle_page.dart';
import 'package:bibliot/pages/login_page.dart';
import 'package:bibliot/routes/app.routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    Bibliot());
}

class Bibliot extends StatefulWidget {
  const Bibliot({super.key});

  @override
  State<Bibliot> createState() => _BibliotState();
}

class _BibliotState extends State<Bibliot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bibliot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF17A7A8),
          primary: Color(0xFF17A7A8),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF17A7A8),
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (ctx) => LoginPage(),
        AppRoutes.home: (ctx) => TogglePage(),
        AppRoutes.register: (ctx) => ResgisterPage(),
      },
    );
  }
}
