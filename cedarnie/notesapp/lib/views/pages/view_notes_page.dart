import 'package:flutter/material.dart';
import 'package:notesapp/data/database/boxes.dart';
import 'package:notesapp/data/database/note.dart';
import 'package:notesapp/views/pages/note_page.dart';
import 'package:notesapp/views/widgets/hero_widget.dart';

class ViewNotesPage extends StatefulWidget {
  const ViewNotesPage({super.key});

  @override
  State<ViewNotesPage> createState() => _ViewNotesPageState();
}

class _ViewNotesPageState extends State<ViewNotesPage> {
  String? menuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            children: [
              Center(child: HeroWidget()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: boxNotes.length,
                  itemBuilder: (context, index) {
                    Note note = boxNotes.getAt(index);
                    return ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      tileColor: Color.fromARGB(113, 0, 0, 0),
                      contentPadding: EdgeInsets.all(8),
                      onTap: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return NotePage(noteId: note.title);
                          },));
                        });
                      },
                      leading: IconButton(
                        onPressed: () {
                          setState(() {
                            boxNotes.deleteAt(index);
                          });
                        },
                        icon: Icon(Icons.delete, color: Colors.red.shade400),
                      ),
                      title: Text(note.title),
                      subtitle: Text("Note name"),
                     // trailing: Text(note.description),
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
