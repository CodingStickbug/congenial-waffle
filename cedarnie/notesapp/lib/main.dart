import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isSwitched ? ThemeData.dark() : ThemeData.light(),
      //colorScheme: ColorScheme.fromSeed(
      //seedColor: Color.fromARGB(186, 230, 164, 22),
      //brightness: Brightness.dark,
      //)
      //),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(206, 201, 133, 8),
          title: Text("Note's App"),
          leading: Icon(Icons.note_alt, size: 50.0),
          actions: [
            Switch(
              activeColor: Colors.amberAccent,
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = !isSwitched;
                });
              },
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.note_add),
              label: "New Note",
            ),
            NavigationDestination(
              icon: Icon(Icons.edit_note),
              label: "View Notes",
            ),
          ],
        ),
      ),
    );
  }
}
