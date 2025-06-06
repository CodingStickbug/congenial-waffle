import 'package:flutter/material.dart';
import 'package:fluttery/data/notifiers.dart';
import 'package:fluttery/views/pages/home_page.dart';
import 'package:fluttery/views/pages/profile_page.dart';
import 'package:fluttery/views/widgets/navfile_widget.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(176, 255, 153, 0),
          title: Center(child: Text("The best damned Flutter application")),
        ),
        body: ValueListenableBuilder(valueListenable: selectedPageNotifier, builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },),
        bottomNavigationBar: NavBarWidget()
      );
  }
}