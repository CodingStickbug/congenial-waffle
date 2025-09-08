import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:open_filex/open_filex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: FilledButton(onPressed: () async {
          await OpenFilex.open("assets/files/STEFAN GROBLER 1.pdf");
        }, child: Text("Open File")))
      ),
    );
  }
}