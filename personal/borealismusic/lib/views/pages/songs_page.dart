import 'package:borealismusic/constants/app_colors.dart';
import 'package:borealismusic/data/database/boxes.dart';
import 'package:borealismusic/data/database/song.dart';
import 'package:borealismusic/functions/file_picker_functions.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SongsPage extends StatefulWidget {
  const SongsPage({super.key});

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  final player = AudioPlayer();

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void pauseOrPlay() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  Duration position = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });

    player.durationStream.listen((d) {
      setState(() {
        totalDuration = d!;
      });
    });

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          position = Duration.zero;
        });
        player.pause();
        player.seek(position);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 5),
            Text(
              "All Songs",
              style: TextStyle(
                fontSize: 35,
                fontFamily: "Borealis",
                color: mainTextColor,
              ),
            ),
            SizedBox(height: 5),
            Divider(indent: 15, endIndent: 15, color: mainTextColor),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(),
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: mainButtonColor),
                onPressed: () async {
                  var file = await pickFile();
                  boxSongs.put(
                    "key_${file?.name}",
                    Song(name: file!.name, pathName: file.path!),
                  );
                },
                child: Text("Add Song"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: boxSongs.length,
                itemBuilder: (context, index) {
                  Song song = boxSongs.getAt(index);
                  return ListTile(
                    onTap: () async {
                      await player.setFilePath(song.pathName);
                      player.play();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return SongPage(songName: song.name);
                      //     },
                      //   ),
                      // );
                    },
                    title: Text(
                      song.name,
                      style: TextStyle(color: mainTextColor),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
