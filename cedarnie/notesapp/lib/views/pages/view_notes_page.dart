import 'package:flutter/material.dart';

class ViewNotesPage extends StatelessWidget {
  const ViewNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [Text("View notes page (Secondary)")],
          ),
        ),
      ),
    );
  }
}
