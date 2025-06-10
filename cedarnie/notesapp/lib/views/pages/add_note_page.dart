import 'package:flutter/material.dart';
import 'package:notesapp/data/database/boxes.dart';
import 'package:notesapp/data/database/note.dart';
import 'package:notesapp/views/widgets/hero_widget.dart';
import 'package:notesapp/views/widgets/widget_tree.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerNote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            children: [
              Center(child: HeroWidget()),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Add Note",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 750,
                      child: TextField(
                        controller: controllerTitle,
                        decoration: InputDecoration(
                          hintText: "Title",
                          contentPadding: EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 750,
                      child: TextFormField(
                        controller: controllerNote,
                        keyboardType: TextInputType.multiline,
                        maxLines: 13,
                        decoration: InputDecoration(
                          hintText: "Note: just start writing...",
                          contentPadding: EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Color.fromARGB(113, 0, 0, 0),
                              content: Center(child: Text("Note Created!", style: TextStyle(color: Colors.white),))
                            )
                          );
                          boxNotes.put(
                            "key_${controllerTitle.text}",
                            Note(
                              title: controllerTitle.text,
                              description: controllerNote.text,
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WidgetTree();
                              },
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(500, 50),
                      ),
                      child: Text("Create Note"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
