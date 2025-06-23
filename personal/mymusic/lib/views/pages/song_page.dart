import 'package:flutter/material.dart';
import 'package:mymusic/data/playlist_provider.dart';
import 'package:mymusic/views/widgets/neu_box.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  String formatTime(Duration duration) {
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString();
    String formattedtime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedtime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        final playlist = value.playlist;
        final currentSongIndex = playlist[value.currentSongIndex ?? 0];
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Center(
              child: Text("P L A Y L I S T", style: TextStyle(fontSize: 25)),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 45,
                top: 15,
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      SizedBox(
                        width: 400,
                        child: NeuBox(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(12),
                                child: Image.asset(
                                  currentSongIndex.imagePath,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentSongIndex.songName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          currentSongIndex.artistName,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.favorite, color: Colors.red),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 400,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(formatTime(value.currentDuration)),
                                  Icon(Icons.shuffle),
                                  Icon(Icons.repeat),
                                  Text(formatTime(value.totalDuration)),
                                ],
                              ),
                            ),
                            Slider(
                              min: 0,
                              max: value.totalDuration.inSeconds.toDouble(),
                              inactiveColor: Colors.black,
                              value: value.currentDuration.inSeconds.toDouble(),
                              onChanged: (double double) {},
                              onChangeEnd: (double double) {
                                value.seek(Duration(seconds: double.toInt()));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),

                      SizedBox(
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 15,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: value.playPreviousSong,
                                child: NeuBox(child: Icon(Icons.skip_previous)),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: value.pauseOrResume,
                                child: NeuBox(child: Icon(value.isPlaying ? Icons.pause : Icons.play_arrow)),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: value.playNextSong,
                                child: NeuBox(child: Icon(Icons.skip_next)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
