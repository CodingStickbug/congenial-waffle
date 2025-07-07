import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_switch/flutter_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isTrue = false;
  bool isFalse = false;
  int animBool = 0;
  bool one = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Flutter Switches"))),
        body: Center(
          child: Column(
            children: [
              FlutterSwitch(
                activeText: 'dark',
                inactiveText: 'light',
                activeTextColor: Colors.white,
                activeIcon: Icon(Icons.dark_mode),
                inactiveIcon: Icon(Icons.sunny, color: Colors.amber),
                activeColor: Colors.grey[900]!,
                inactiveColor: Colors.grey[500]!,
                value: isTrue,
                onToggle: (value) {
                  setState(() {
                    isTrue = value;
                  });
                },
              ),
              SizedBox(height: 20),
              FlutterSwitch(
                borderRadius: 20,
                width: 140,
                height: 70,
                toggleSize: 50,
                value: isTrue,
                onToggle: (value) {
                  setState(() {
                    isTrue = value;
                  });
                },
              ),
              SizedBox(height: 10),
              AdvancedSwitch(
                width: 100,
                height: 40,
                initialValue: isFalse,
                activeChild: Text("Active"),
                inactiveChild: Text("Inactive"),
                thumb: Icon(isFalse ? Icons.arrow_forward : Icons.arrow_back),
                onChanged: (value) {
                  setState(() {
                    isFalse = value;
                  });
                },
              ),
              AdvancedSwitch(
                width: 100,
                height: 40,
                initialValue: isFalse,
                activeChild: Text("Active"),
                inactiveChild: Text("Inactive"),
                onChanged: (value) {
                  setState(() {
                    isFalse = value;
                  });
                },
              ),
              SizedBox(height: 50),
              AnimatedToggleSwitch<int>.rolling(
                current: animBool,
                values: [0, 1, 2, 3],
                onChanged: (value) => setState(() {
                  animBool = value;
                }),
                iconList: [
                  Icon(Icons.abc),
                  Icon(Icons.abc_outlined),
                  Icon(Icons.abc_rounded),
                  Icon(Icons.abc_sharp),
                ],
              ),
              SizedBox(height: 10),
              AnimatedToggleSwitch.dual(
                textBuilder: (value) {
                  if (one == true) {
                    return Text("Dark", style: TextStyle(fontSize: 25, color: Colors.white));
                  }
                  return Text("Light", style: TextStyle(fontSize: 25));
                },
                iconBuilder: (value) {
                  if (one == true) {
                    return Icon(Icons.dark_mode);
                  }
                  return Icon(Icons.light_mode);
                },
                style: ToggleStyle(
                  backgroundColor: one ? Colors.black : Colors.white,
                ),
                indicatorSize: Size(50, 50),
                current: one,
                first: false,
                second: true,
                onChanged: (value) {
                  setState(() {
                    one = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
