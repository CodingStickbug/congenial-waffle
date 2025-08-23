import 'package:borealismusic/constants/app_colors.dart';
import 'package:borealismusic/constants/constants.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.water, size: 45),
          SizedBox(width: 10),
          Text("Borealis Music", style: TextStyle(fontFamily: 'Borealis')),
        ],
      ),
      backgroundColor: mainColor,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: BoxBorder.fromLTRB(
                  top: BorderSide(color: Colors.blueGrey),
                  left: BorderSide(color: Colors.blueGrey),
                  right: BorderSide(color: Colors.blueGrey),
                ),
              ),
              height: 45,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: (selectedPageNotifier.value == 0) ? selectedColor : secondaryMainColor,
                  shape: BeveledRectangleBorder(),
                ),
                onPressed: () {
                  setState(() {
                    selectedPageNotifier.value = 0;
                  });
                },
                child: Text("Songs", style: TextStyle(fontFamily: 'Borealis')),
              ),
            ),
            SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                border: BoxBorder.fromLTRB(
                  top: BorderSide(color: Colors.blueGrey),
                  left: BorderSide(color: Colors.blueGrey),
                  right: BorderSide(color: Colors.blueGrey),
                ),
              ),
              height: 45,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: (selectedPageNotifier.value == 1)
                      ? selectedColor
                      : secondaryMainColor,
                  shape: BeveledRectangleBorder(),
                ),
                onPressed: () {
                  setState(() {
                    selectedPageNotifier.value = 1;
                  });
                },
                child: Text(
                  "Playlists",
                  style: TextStyle(fontFamily: 'Borealis'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
