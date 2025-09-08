import 'package:borealismusic/constants/app_colors.dart';
import 'package:borealismusic/constants/constants.dart';
import 'package:borealismusic/data/database/boxes.dart';
import 'package:borealismusic/data/database/song.dart';
import 'package:borealismusic/functions/file_picker_functions.dart';
import 'package:flutter/material.dart';

class SongsPage extends StatefulWidget {
  const SongsPage({super.key});

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  Duration position = Duration.zero;
  Duration totalDuration = Duration.zero;

  // @override
  // void initState() {
  //   super.initState();

  //   player.positionStream.listen((p) {
  //     setState(() {
  //       position = p;
  //     });
  //   });

  //   player.durationStream.listen((d) {
  //     setState(() {
  //       totalDuration = d!;
  //     });
  //   });

  //   player.playerStateStream.listen((state) {
  //     if (state.processingState == ProcessingState.completed) {
  //       setState(() {
  //         position = Duration.zero;
  //       });
  //       player.pause();
  //       player.seek(position);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    bool enabled = false;
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
                  var file = await pickFileAndSaveLocally();
                  boxSongs.put(
                    "key_${file?.name}",
                    Song(name: file!.name, pathName: file.path!),
                  );
                },
                child: Text(
                  "Add Song",
                  style: TextStyle(fontFamily: "Borealis"),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  itemCount: boxSongs.length,
                  itemBuilder: (context, index) {
                    Song song = boxSongs.getAt(index);
                    return Column(
                      children: [
                        SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(134, 128, 165, 182),),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            selected: enabled,
                            onTap: () async {
                              print("LOOOOOOOOOOOK HEREEEEEEEEEEEEEE ===========>>>>>${song.hashCode}");
                              print(song.pathName);
                              setState(() {
                                enabled = true;
                              });
                              await player.setFilePath(song.pathName);
                              player.play();
                              // if (context.mounted) {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) {
                              //         return SongPage(songName: song.name);
                              //       },
                              //     ),
                              //   );
                              // }
                            },
                            title: Text(
                              song.name,
                              style: TextStyle(
                                color: mainTextColor,
                                fontFamily: "Borealis",
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
