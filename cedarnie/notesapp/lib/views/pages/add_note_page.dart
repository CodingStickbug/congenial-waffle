import 'package:flutter/material.dart';
import 'package:notesapp/views/widgets/hero_widget.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Flexible(child: HeroWidget(title: "Add note")),
              Text("Add note page (home)"),
            ],
          ),
        ),
      ),
    );
  }
}
