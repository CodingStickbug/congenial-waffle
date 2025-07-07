import 'package:flutter/material.dart';
import 'package:music/data/database/boxes.dart';
import 'package:music/data/database/song.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text("Add Song")),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () {
                boxSongs.put(
                  "key_cool",
                  Song(songTitle: "Test", audio: "music/The Housebuilding Song.mp3", imagePath: "assets/images/fnv.jpg", artist: "Unknown Artist"),
                );
              },
              child: Text("Create Song (for testing)"),
            ),
            FilledButton(
              onPressed: () {
                boxSongs.deleteAt(0);
              },
              child: Text("Delete Song (for testing)"),
            ),
          ],
        ),
      ),
    );
  }
}
