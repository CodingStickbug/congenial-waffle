import 'package:flutter/material.dart';
import 'package:music/data/notifiers.dart';
import 'package:music/views/pages/home_page.dart';
import 'package:music/views/pages/playlists_page.dart';
import 'package:music/views/pages/settings_page.dart';
import 'package:music/views/pages/temp_page.dart';
import 'package:music/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), PlaylistsPage(), SettingsPage(), TempPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
