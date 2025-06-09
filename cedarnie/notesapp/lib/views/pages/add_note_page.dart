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
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 750,
                      child: TextField(
                          decoration: InputDecoration(
                            hintText: "Title",
                            contentPadding: EdgeInsets.all(8.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 750,
                      child: TextFormField(
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
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: () {
                      
                    }, 
                    style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                    child: Text("Create Note"))
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
