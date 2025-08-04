import 'package:flutter/material.dart';

void main() async {
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
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              children: [
                FilledButton(onPressed: () {}, child: Text("Take SS to save")),
                FilledButton(onPressed: () {}, child: Text("Load image")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
