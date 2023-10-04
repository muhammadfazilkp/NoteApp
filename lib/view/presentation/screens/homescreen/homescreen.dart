import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/view/presentation/screens/add_note_page/add_note.dart';

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
              fontWeight: FontWeight.w600, color: Colors.purple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                elevation: 4.0,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Note $index',
                          style: const TextStyle(fontSize: 18.0)),
                      const SizedBox(height: 8.0),
                      const Text('This is a sample note.'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 112, 36, 204),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()));
          // Handle button press to create a new note
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
