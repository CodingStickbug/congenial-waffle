import 'package:flutter/material.dart';
import 'package:music/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(143, 66, 42, 2),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          child: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.music_note, color: Colors.white),
                label: "Songs",
              ),
              NavigationDestination(
                icon: Icon(Icons.list, color: Colors.white),
                label: "Playlists",
              ),
              NavigationDestination(
                icon: Icon(Icons.settings, color: Colors.white),
                label: "Settings",
              ),
              NavigationDestination(
                icon: Icon(Icons.settings, color: Colors.white),
                label: "Add song (temp)",
              ),
            ],
            onDestinationSelected: (int value) {
              selectedPageNotifier.value = value;
            },
            selectedIndex: selectedPage,
          ),
        );
      },
    );
  }
}
