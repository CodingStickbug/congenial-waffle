import 'package:flutter/material.dart';
import 'package:notesapp/data/notifiers.dart';
import 'package:notesapp/views/pages/add_note_page.dart';
import 'package:notesapp/views/pages/view_notes_page.dart';
import 'package:notesapp/views/widgets/navbar_widget.dart';

List<Widget> pages = [AddNotePage(), ViewNotesPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(218, 41, 39, 39),
        title: Text("Note's App", style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.note_alt, size: 50.0, color: Colors.white,),
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
