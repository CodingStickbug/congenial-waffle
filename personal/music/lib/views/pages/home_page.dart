import 'package:flutter/material.dart';
import 'package:music/data/database/boxes.dart';
import 'package:music/data/database/song.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(content: Text("Hello, world"));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  key: _scaffoldKey,
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
            onTap: () {
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(days: 1),
                    backgroundColor: Color.fromARGB(112, 24, 14, 4),
                    content: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              song.playPreviousSong();
                            },
                            icon: Icon(Icons.skip_previous),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                song.pauseOrResume();
                              });
                            },
                            icon: Icon(
                              song.isPlaying ? Icons.play_arrow : Icons.pause,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              song.playNextSong();
                            },
                            icon: Icon(Icons.skip_next),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                song.play();
              });
            },
            title: Text(song.songTitle),
          );
        },
      ),
    );
  }
}
