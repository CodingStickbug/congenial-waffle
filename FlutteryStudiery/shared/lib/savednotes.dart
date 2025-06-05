import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SavedNotes extends StatefulWidget {
  const SavedNotes({super.key});

  @override
  State<SavedNotes> createState() => _SavedNotesState();
}

class _SavedNotesState extends State<SavedNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(199, 173, 128, 5),
        title: Text("Shared Preferences Testing Application"),
      ),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                //final SharedPreferences prefs = 
                  //await SharedPreferences.getInstance();
                //final String? name = prefs.getString("note_name");
                //print("stored value: $name");
              }, 
              child: Text("Note name:")      
              )
          ],
        ),
      ),
    );
  }
}