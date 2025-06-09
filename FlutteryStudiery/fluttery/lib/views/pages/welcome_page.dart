import 'package:flutter/material.dart';
import 'package:fluttery/data/constants.dart';
import 'package:fluttery/data/notifiers.dart';
import 'package:fluttery/views/pages/login_page.dart';
import 'package:fluttery/views/pages/register_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(176, 255, 153, 0),
        title: Center(
          child: Text(
            "The Best Flutter Application",
            style: HTextStyle.mainHeaderText,
          ),
        ),
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Center(child: Lottie.asset("assets/lotties/welcome.json")),
            ),
            FittedBox(
              child: Text(
                "The Best Flutter Application",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0, letterSpacing: 15),
              ),
            ),
            SizedBox(height: 15,),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ),
                );
              },
              style: FilledButton.styleFrom(minimumSize: Size(750, 50)),
              child: Text("Get Started"),
            ),
            SizedBox(height: 5,),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              style: TextButton.styleFrom(minimumSize: Size(750, 50)),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
