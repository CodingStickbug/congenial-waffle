import 'package:flutter/material.dart';
import 'package:music/data/database/boxes.dart';
import 'package:music/data/database/song.dart';
import 'package:music/views/pages/song_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text("Songs")),
      ),
      body: ListView.builder(
        itemCount: boxSongs.length,
        itemBuilder: (context, index) {
          Song song = boxSongs.getAt(index);
          return ListTile(
            leading: Image.asset(song.imagePath),
            title: Text(song.songTitle),
            subtitle: Text(song.artist),
            contentPadding: EdgeInsets.all(7),
            onTap: () {
              if (song.isPlaying) {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SongPage(title: song.songTitle);
                      },
                    ),
                  );
                });
              } else {
                setState(() {
                  song.play();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SongPage(title: song.songTitle);
                      },
                    ),
                  );
                });
              }
            },
          );
        },
      ),
    );
  }
}
