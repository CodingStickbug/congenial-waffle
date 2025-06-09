import 'package:flutter/material.dart';
import 'package:fluttery/data/constants.dart';
import 'package:fluttery/data/notifiers.dart';
import 'package:fluttery/views/pages/home_page.dart';
import 'package:fluttery/views/pages/profile_page.dart';
import 'package:fluttery/views/pages/settings_page.dart';
import 'package:fluttery/views/widgets/navfile_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(176, 255, 153, 0),
        leading: Icon(Icons.notes_rounded, color: Colors.white),
        title: Text(
          "The best damned Flutter application",
          style: HTextStyle.mainHeaderText,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.themeModeKey,
                isDarkModeNotifier.value,
              );
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkmode, child) {
                return Icon(
                  isDarkmode ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                );
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: "Settings");
                  },
                ),
              );
            },
            icon: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
