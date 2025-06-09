import 'package:flutter/material.dart';
import 'package:fluttery/data/constants.dart';
import 'package:fluttery/data/notifiers.dart';
import 'package:fluttery/views/pages/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          ListTile(
            title: Center(child: Text("Logout", style: HTextStyle.titleText,)),
            onTap: () {
              selectedPageNotifier.value = 0;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomePage();
                  },
                ),
              );
            },
          ),
          Divider(),
          SizedBox(height: 50.0, child: VerticalDivider(),),
        ],
      ),
    );
  }
}
