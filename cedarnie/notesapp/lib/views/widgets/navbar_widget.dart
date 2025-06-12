import 'package:flutter/material.dart';
import 'package:notesapp/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for update to the Selected Page
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        // Bottom Navigation bar
        return NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.note_add),
              label: "New Note",
            ),
            NavigationDestination(
              icon: Icon(Icons.edit_note),
              label: "View Notes",
            ),
          ],
          // Change selected page value for both Navigation and keeping track of page
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          // Change index of Navigation bar
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
