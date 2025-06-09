import 'package:flutter/material.dart';
import 'package:fluttery/data/notifiers.dart';
import 'package:fluttery/views/pages/welcome_page.dart';

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
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: isDarkModeNotifier, builder: (context, isDarkmode, child) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(176, 255, 153, 0),
          brightness: isDarkmode ? Brightness.dark : Brightness.light,
        ),
      ),
      home: WelcomePage(),
    );
    },);
  }
}
