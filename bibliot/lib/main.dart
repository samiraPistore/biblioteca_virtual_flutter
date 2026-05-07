import 'package:bibliot/pages/resgister_page.dart';
import 'package:bibliot/pages/toggle_page.dart';
import 'package:bibliot/pages/login_page.dart';
import 'package:bibliot/providers/app_controller.dart';
import 'package:bibliot/providers/favorites.dart';
import 'package:bibliot/routes/app.routes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o Flutter foi inicializado antes de usar plugins
  await Hive.initFlutter(); // Inicializa o Hive para armazenamento local
  final box = await Hive.openBox('user');
  final token = box.get('token');
  await Hive.openBox('settings'); // Abre uma caixa para armazenar dados
  await Hive.openBox('books'); // Abre uma caixa para armazenar dados

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => AppController()),
      ],
      child: Bibliot(isLogged: token != null),
    ),
  ); // Passa o estado de login para a aplicação));
}

class Bibliot extends StatefulWidget {
  final bool isLogged;
  const Bibliot({super.key, required this.isLogged});

  @override
  State<Bibliot> createState() => _BibliotState();
}

class _BibliotState extends State<Bibliot> {
  @override
  Widget build(BuildContext context) {
    final temaAtual = Provider.of<AppController>(context);
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

      //tema escuro
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Color.fromARGB(255, 5, 114, 114), // Fundo mais escuro
          onSurface: Colors.white, // Texto claro para contraste),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 5, 114, 114),

          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 239, 237, 237),
          ), // Cor do texto/icones no modo escuro
        ),
      ),
      themeMode: temaAtual.themeMode,

      initialRoute: widget.isLogged ? AppRoutes.home : AppRoutes.login,
      routes: {
        AppRoutes.login: (ctx) => LoginPage(),
        AppRoutes.home: (ctx) => TogglePage(),
        AppRoutes.register: (ctx) => ResgisterPage(),
      },
    );
  }
}
