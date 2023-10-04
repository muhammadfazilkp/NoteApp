import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:note_app/model/model.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SafeArea(
          child: Card(
            child: Consumer<CrudOpretion>(
              builder: (context, value, child) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      controller: value.titleController,
                      decoration: InputDecoration(
                        hintMaxLines: 1,
                        label: Text(
                          'Title',
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 20),
                        ),
                      ),
                      // maxLength: 25,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: value.contentController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      maxLines: 20,
                      // maxLength: 150,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Consumer<CrudOpretion>(
          builder: (context, note, child) => FloatingActionButton.extended(
            backgroundColor: const Color.fromARGB(255, 112, 36, 204),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                note.addNote(Note(
                    title: note.titleController.text.trim(),
                    content: note.contentController.text.trim()));
                  
              }
              // Add your action when the button is pressed.
            },
            label: Text(
              'Save Note',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
