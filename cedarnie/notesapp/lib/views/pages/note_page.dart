import 'package:flutter/material.dart';
import 'package:notesapp/data/database/boxes.dart';
import 'package:notesapp/views/pages/edit_note_page.dart';
import 'package:notesapp/views/widgets/hero_widget.dart';
import 'package:notesapp/views/widgets/widget_tree.dart';

class NotePage extends StatefulWidget {
  // Get noteId from ViewNotes()
  const NotePage({super.key, required this.noteId});

  final String noteId;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(206, 201, 133, 8),
        title: Text("Note's App"),
        // Return to Previous page/ViewNotesPage()
        leading: TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return WidgetTree();
            },));
          },
          child: Icon(
            Icons.close,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            children: [
              Center(child: HeroWidget()),
              Center(
                // Load information of note from database
                child: Builder(
                  builder: (context) {
                    final note = boxNotes.values.firstWhere(
                      (note) => note.title == widget.noteId,
                    );
                    // Display information from database
                    return ListTile(
                      title: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Note title
                            Text(
                              note.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            // Edit note. (Re-directs user to similar page where they can edit and save note)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return EditNotePage(noteId: note.title,);
                                  },));
                                });
                              },
                              child: Icon(Icons.edit, color: Colors.white),
                            ),
                            Divider(),
                            // Description of note
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color.fromARGB(113, 0, 0, 0),
                              ),
                              child: Text(note.description),
                            ),
                          ],
                        ),
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
