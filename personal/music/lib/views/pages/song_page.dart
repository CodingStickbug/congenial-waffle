import 'package:flutter/material.dart';
import 'package:music/data/database/boxes.dart';
import 'package:music/data/database/song.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key, required this.title});
  final String title;

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Builder(
          builder: (context) {
            Song song = boxSongs.values.firstWhere(
              (song) => song.songTitle == widget.title,
            );
            return ListTile(
              title: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackButton(),
                          Text(
                            song.songTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.menu),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(1000),
                          child: Image.asset(song.imagePath),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(song.currentDuration.toString()),
                          Icon(
                            Icons.favorite,
                            size: 30,
                            color: Color.fromARGB(207, 194, 8, 8),
                          ),
                          Text(song.totalDuration.toString()),
                        ],
                      ),
                      Slider(value: 1, onChanged: (value) {}),
                      Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  song.playPreviousSong();
                                },
                                icon: Icon(Icons.skip_previous),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    song.pauseOrResume();
                                  });
                                },
                                icon: Icon(
                                  song.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  song.playNextSong();
                                },
                                icon: Icon(Icons.skip_next),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
