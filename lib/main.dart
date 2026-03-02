import 'package:flutter/material.dart';
import 'package:flutter_test1/data/constants.dart';
import 'package:flutter_test1/data/notifiers.dart';
import 'package:flutter_test1/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initTheme();
    super.initState();
  }
  void initTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDarkMode = prefs.getBool(Kconstants.isDarkModeKey) ?? false;
    isDarkModeNotifier.value = isDarkMode;
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
          ),
          home: const WelcomePage(),
        );
      },
    );
  }
    
}
