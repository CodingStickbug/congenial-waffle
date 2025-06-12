import 'package:flutter/material.dart';
import 'package:notesapp/data/database/boxes.dart';
import 'package:notesapp/data/database/note.dart';
import 'package:notesapp/views/pages/note_page.dart';
import 'package:notesapp/views/widgets/hero_widget.dart';

// View notes, select note to view, and delete notes.

class ViewNotesPage extends StatefulWidget {
  const ViewNotesPage({super.key});

  @override
  State<ViewNotesPage> createState() => _ViewNotesPageState();
}

class _ViewNotesPageState extends State<ViewNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            children: [
              Center(child: HeroWidget()),
              // List of notes and styling of notes
              Padding(
                padding: const EdgeInsets.all(8.0),
                // Build notes from database
                child: ListView.builder(
                  itemCount: boxNotes.length,
                  itemBuilder: (context, index) {
                    Note note = boxNotes.getAt(index);
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tileColor: Color.fromARGB(113, 0, 0, 0),
                      contentPadding: EdgeInsets.all(8),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NotePage(noteId: note.title);
                              },
                            ),
                          );
                        });
                      },
                      // Note information
                      title: Text(note.title),
                      subtitle: Text("Note name"),
                      // Delete Notes
                      trailing: IconButton(
                        onPressed: () {
                          // Confirm deletion to avoid accidental deletion
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actionsAlignment: MainAxisAlignment.center,
                                icon: Icon(Icons.delete),
                                title: Text("Are you sure you want to delete?"),
                                content: Text("This action cannot be undone."),
                                actions: [
                                  // Confirm DELETION
                                  FilledButton(
                                    onPressed: () {
                                      setState(() {
                                        boxNotes.deleteAt(index);
                                        Navigator.pop(context);
                                      });
                                    },
                                    style: FilledButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    child: Text("Delete"),
                                  ),
                                  // Cancel deletion
                                  FilledButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Text("Cancel"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.delete, color: Colors.red.shade400),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
