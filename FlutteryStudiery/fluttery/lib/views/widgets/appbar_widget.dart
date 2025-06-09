import 'package:flutter/material.dart';
import 'package:fluttery/data/notifiers.dart';
import 'package:fluttery/views/pages/settings_page.dart';

// IMPORTANT COME BACK TO THIS PAGE IT"S CURRENTLY NOT IN USE

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color.fromARGB(176, 255, 153, 0),
        title: Center(child: Text("The best damned Flutter application")),
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkmode, child) {
                return Icon(isDarkmode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: "Settings",);
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      );
  }
}