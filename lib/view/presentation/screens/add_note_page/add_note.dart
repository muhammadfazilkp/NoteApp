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
        // backgroundColor: Colors.grey[100],
        body: Consumer<CrudOpretion>(
          builder: (context, value, child) => Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/fasil.png'), fit: BoxFit.cover)),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLength: 20,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter the title';
                          } else {
                            return null;
                          }
                        },
                        controller: value.titleController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLength: 150,
                        controller: value.contentController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please write something';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'content',
                                  style: GoogleFonts.poppins(),
                                ))),
                        maxLines: 20,
                        // maxLength: 150,
                      ),
                    ),
                  ),
                ),
              ],
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
                note.titleController.text = '';
                note.contentController.text = '';
                Navigator.pop(context);
              }
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
