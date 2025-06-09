import 'package:flutter/material.dart';
import 'package:fluttery/data/constants.dart';
import 'package:fluttery/data/notifiers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 00.0;
  String? menuItem = "e1";
  bool? yourMum = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(176, 255, 153, 0),
        title: Center(
          child: Text("The settings of the best damned Flutter application", style: HTextStyle.mainHeaderText,),
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
                return Icon(isDarkmode ? Icons.light_mode : Icons.dark_mode, color: Colors.white,);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: "e1", child: Text("Father")),
                  DropdownMenuItem(value: "e2", child: Text("I")),
                  DropdownMenuItem(value: "e3", child: Text("Hunger")),
                ],
                onChanged: (value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () => setState(() {}),
              ),
              Text(controller.text),
              CheckboxListTile(
                title: Text("Click me, if you dare.", style: HTextStyle.basicDescriptionText,),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Switch me!", style: HTextStyle.basicDescriptionText,),
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider(
                value: sliderValue,
                max: 10.0,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text(
                        "0.........................................................................................................__________________________________________________________________________________..........................................................................................0 W H A Le of a T I M E",
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text("Click me I'm Awesome!"),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        icon: Icon(Icons.home),
                        title: Text("Alert: Red spy in the base."),
                        content: Text("Red spy in the base?"),
                        actions: [
                          CheckboxListTile(
                            title: Text("Yes!"),
                            value: yourMum,
                            onChanged: (value) {
                              setState(() {
                                yourMum = value;
                              });
                            },
                          ),
                          FilledButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text("Close"))
                        ],
                      );
                    },
                  );
                },
                child: Text("DON'T click me! I'm NOT Awesome!"),
              ),
              InkWell(
                splashColor: const Color.fromARGB(255, 75, 56, 4),
                onTap: () => selectedPageNotifier.value = 1,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Color.fromARGB(176, 255, 153, 0),
                ),
              ),
              FilledButton(onPressed: () {}, child: Icon(Icons.auto_awesome)),
              TextButton(onPressed: () {}, child: Icon(Icons.auto_awesome)),
              OutlinedButton(onPressed: () {}, child: Icon(Icons.auto_awesome)),
              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
