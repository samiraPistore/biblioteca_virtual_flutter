import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppController extends ChangeNotifier {
  final Box settingsBox = Hive.box("settings"); // Acessa a box "settings"

  bool isDarkTheme = false; 

  AppController() {
    loadTheme();
  }

  void loadTheme() {
    isDarkTheme =
        settingsBox.get("isDarkTheme", defaultValue: false);//salvar tema escolhido 
    notifyListeners(); //avisar demais telas e elementos 
  }

  void changeTheme() {
    isDarkTheme = !isDarkTheme;

    settingsBox.put("isDarkTheme", isDarkTheme);

    notifyListeners();
  }

  ThemeMode get themeMode =>
      isDarkTheme ? ThemeMode.dark : ThemeMode.light; // muda tema conforme valor do isDarkTheme
}