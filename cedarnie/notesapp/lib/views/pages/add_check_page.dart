import 'package:flutter/material.dart';
import 'package:notesapp/data/database/boxes.dart';
import 'package:notesapp/data/database/note.dart';
import 'package:notesapp/views/widgets/hero_widget.dart';
import 'package:notesapp/views/widgets/widget_tree.dart';

// Add a new note to the database

class AddCheckPage extends StatefulWidget {
  const AddCheckPage({super.key});

  @override
  State<AddCheckPage> createState() => _AddCheckPageState();
}

class _AddCheckPageState extends State<AddCheckPage> {
  // Text editing controllers to save user input
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerNote = TextEditingController();
  bool testing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            children: [
              Center(child: HeroWidget()),
              // Scroll view to ensure user can type forever without errors
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      // Title of page
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return WidgetTree();
                                  },
                                ),
                              );
                            },
                            child: Text("Add Note"),
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: VerticalDivider(),
                          ),
                          FilledButton(
                            onPressed: () {},
                            child: Text("Add To-do"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // User input of the Note's title
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
                      // User input of Note's description
                      SizedBox(
                        width: 750,
                        child: TextFormField(
                          controller: controllerNote,
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
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
                      // Saves the Note title, and Note description into database
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // Check if note already exists

                            // Pop up to give the user confirmation that the note was created succesfuly
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Color.fromARGB(113, 0, 0, 0),
                                content: Center(
                                  child: Text(
                                    "Note Created!",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                            // Saves the note into the database
                            boxNotes.put(
                              "key_${controllerTitle.text}",
                              Note(
                                title: controllerTitle.text,
                                description: controllerNote.text,
                              ),
                            );
                            // Reloads AddCheckPage(), allowing the user to write a new note instantly.
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
