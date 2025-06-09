import 'package:flutter/material.dart';
import 'package:fluttery/data/constants.dart';
import 'package:fluttery/data/notifiers.dart';
import 'package:fluttery/views/widget_tree.dart';
import 'package:fluttery/views/widgets/hero_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String confirmedEmail = "123";
  String confirmedPw = "456";

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(176, 255, 153, 0),
        title: Center(
          child: Text(
            "The Register of the Best Flutter Application",
            style: HTextStyle.mainHeaderText,
          ),
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
                return Icon(isDarkmode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controllerUsername,
                decoration: InputDecoration(
                  hintText: "Username",
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onEditingComplete: () => setState(() {}),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controllerPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onEditingComplete: () => setState(() {}),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  onLogin();
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(750, 50)),
                child: Text("Register"),
              ),
              SizedBox(height: 20),
              Flexible(child: HeroWidget(title: 'Welcome!')),
            ],
          ),
        ),
      ),
    );
  }

  void onLogin() {
    if (confirmedEmail == controllerUsername.text &&
        confirmedPw == controllerPassword.text) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
    }
  }
}