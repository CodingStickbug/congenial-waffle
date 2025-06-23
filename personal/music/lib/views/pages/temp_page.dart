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
                  "key_Legendary",
                  Song(songTitle: "The house building Song", audio: "music/The Housebuilding Song.mp3"),
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
            SizedBox(height: 50),
            FilledButton(
              onPressed: () {
                boxSongs.put(
                  "key_url",
                  Song(
                    songTitle: "Carry you home",
                    audio:
                        "https://www.youtube.com/watch?v=d4iGZ_jP-1U&themeRefresh=1",
                  ),
                );
              },
              child: Text("Testing URL function"),
            ),
            FilledButton(onPressed: () {
              boxSongs.deleteAt(0);
            }, child: Text("Delete URL"))
          ],
        ),
      ),
    );
  }
}
