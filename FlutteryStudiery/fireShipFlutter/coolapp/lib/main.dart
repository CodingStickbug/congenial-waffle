import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 173, 129, 6),
        title: Text("Flutter is cool and flutter is fun!"),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return ElevatedButton(
              child: Text("About"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MyWidget(),
                  )
                );
              }, 
            );
          }
        ),
      ),
    )
  );
  }
}



class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}