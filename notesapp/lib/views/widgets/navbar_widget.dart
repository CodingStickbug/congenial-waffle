import 'package:flutter/material.dart';
import 'package:notesapp/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          backgroundColor: Color.fromARGB(218, 41, 39, 39),
          destinations: [
            NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                  (Set<WidgetState> states) => TextStyle(color: Colors.black),
                ),
              ),
              child: NavigationDestination(
                icon: Icon(
                  Icons.note_add,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                label: "New Note",
              ),
            ),
            NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                  (Set<WidgetState> states) => TextStyle(color: Colors.black),
                ),
              ),
              child: NavigationDestination(
                icon: Icon(
                  Icons.edit_note,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                label: "View Notes",
              ),
            ),
          ],
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
