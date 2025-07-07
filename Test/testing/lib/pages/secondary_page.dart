import 'package:flutter/material.dart';
import 'package:testing/widgets/top_bar.dart';

class SecondaryPage extends StatelessWidget {
  const SecondaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Colors.grey[200]!],
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TopBar(title: "Secondary"),
              Spacer(),
              Center(child: Text("Navigated from notifications")),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
