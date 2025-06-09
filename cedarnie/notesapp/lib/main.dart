import 'package:flutter/material.dart';
import 'package:notesapp/views/widgets/widget_tree.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(186, 230, 164, 22),
      brightness: Brightness.dark,
      )
      ),
      home: WidgetTree(),
    );
  }
}
