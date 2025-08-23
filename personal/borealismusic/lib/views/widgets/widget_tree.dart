import 'package:borealismusic/constants/constants.dart';
import 'package:borealismusic/views/pages/playlists_page.dart';
import 'package:borealismusic/views/pages/songs_page.dart';
import 'package:borealismusic/views/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [SongsPage(), PlaylistsPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
    );
  }
}
