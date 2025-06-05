import 'package:flutter/material.dart';
import 'package:shared/savednotes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(199, 173, 128, 5),
          title: Text("Shared Preferences Testing Application"),
        ),
        body: Center(
          child: Row(
            children: [
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SavedNotes()),
                      );
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          await prefs.setString("note_name", "First Note");
                    },
                    child: Text("Saved Notes"),
                  );
                },
              ),
              ElevatedButton(onPressed: () {}, child: Text("New Note")),
            ],
          ),
        ),
      ),
    );
  }
}
