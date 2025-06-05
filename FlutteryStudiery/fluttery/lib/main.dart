import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String name = "mammoth";
int number = 1;
double float = 1.25;
List myList = ["hellow", "world"];
Map myMap = {"String": "wow"};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 161, 85, 13),
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(color: Color.fromARGB(237, 247, 198, 63)),
        ),
        leading: Icon(Icons.home, color: Color.fromARGB(237, 247, 198, 63)),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/hl.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Center(
              child: Text(
                "Half Life: 3",
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 152, 3),
                  fontSize: 25.0,
                ),
              ),
            ),
            ListTile(
              tileColor: Colors.red,
              title: Text(
                "ListTile",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
