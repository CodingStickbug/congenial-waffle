import 'package:flutter/material.dart';
import 'package:notesapp/data/database/boxes.dart';
import 'package:notesapp/views/pages/note_page.dart';
import 'package:notesapp/views/widgets/hero_widget.dart';

class EditNotePage extends StatefulWidget {
  // Get noteId from ViewNotes()
  const EditNotePage({super.key, required this.noteId});
  final String noteId;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(206, 201, 133, 8),
        title: Text("Note's App"),
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
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
                    TextEditingController noteDesciption =
                        TextEditingController()..text = note.description;
                    // Display information from database
                    return ListTile(
                      title: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Title: unchangeable. (for now at least, might update later)
                            Text(
                              note.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Divider(),
                            // Note description: can now be edited by user
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color.fromARGB(113, 0, 0, 0),
                              ),
                              child: TextField(
                                maxLines: null,
                                controller: noteDesciption,
                              ),
                            ),
                            SizedBox(height: 10),
                            // Saves the new note description and re-directs to NotePage()
                            FilledButton(
                              onPressed: () {
                                setState(() {
                                  boxNotes.put(
                                    "key_${note.title}",
                                    note.copyWith(
                                      description: noteDesciption.text,
                                    ),
                                  );
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return NotePage(noteId: note.title);
                                  },));
                                });
                              },
                              child: Text("Save Note"),
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
