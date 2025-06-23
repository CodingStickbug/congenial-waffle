import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music/data/database/boxes.dart';
import 'package:music/data/database/song.dart';
import 'package:music/themes/dark_mode.dart';
import 'package:music/views/widgets/widget_tree.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(SongAdapter());
  boxSongs = await Hive.openBox<Song>("songBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkMode,
      home: WidgetTree(),
    );
  }
  Widget appBar(String title) {
    return AppBar(
      title: Center(child: Text(title)),
    );
  }
}