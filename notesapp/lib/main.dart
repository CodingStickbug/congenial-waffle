import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/data/database/boxes.dart';
import 'package:notesapp/data/database/note.dart';
import 'package:notesapp/views/widgets/widget_tree.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  boxNotes = await Hive.openBox<Note>('noteBox');
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
    super.initState();
    initThememode();
  }

  Future<void> initThememode() async {
    // ignore: unused_local_variable
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(218, 41, 34, 34),
      brightness: Brightness.light,
      )
      ),
      home: WidgetTree(),
    );
  }
}
