import 'package:flutter/material.dart';
import 'package:mymusic/data/playlist_provider.dart';
import 'package:mymusic/data/song.dart';
import 'package:mymusic/views/pages/song_page.dart';
import 'package:mymusic/views/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playlistProvider;
  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SongPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Center(child: Text("Da Music")),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: DrawerWidget(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final List<Song> playlist = value.playlist;

          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final Song song = playlist[index];
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.imagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
