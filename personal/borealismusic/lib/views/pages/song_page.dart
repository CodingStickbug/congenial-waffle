import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key, required this.songName});
  final String songName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songName),
      ),
    );
  }
}