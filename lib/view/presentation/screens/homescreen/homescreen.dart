import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/view/presentation/screens/add_note_page/add_note.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, Key? y});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset(
            'asset/add-notes-concept-illustration_114360-2496.avif',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'Notes',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.purple,
          ),
        ),
      ),
      body: Consumer<CrudOpretion>(
        builder: (context, value, child) => FutureBuilder<List<Note>>(
          future: value.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No notes available'),
              );
            } else {
              final notes = snapshot.data;

              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final note = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                        elevation: 4.0,
                        child: InkWell(
                          onLongPress: () {
                            // Show a dialog or perform the delete action here
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Delete Note',
                                    style: GoogleFonts.poppins(),
                                  ),
                                  content: const Text(
                                      'Are you sure you want to delete this note?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Perform the delete action here
                                        value.deleteNote(index);
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    note.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 2,
                                color: Colors.green,
                              ),
                              const SizedBox(height: 8.0),
                              Text(note.content, style: GoogleFonts.poppins()),

                              // Use note title here
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 112, 36, 204),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()));
        },
        label: Text(
          'Create Note',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
