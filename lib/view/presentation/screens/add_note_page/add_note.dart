import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      'Title',
                      style:
                          GoogleFonts.poppins(color: Colors.grey, fontSize: 20),
                    ),
                    // border: OutlineInputBorder()
                  ),
                ),
              ),
              Expanded(
                  child: TextFormField(
                decoration: const InputDecoration(border: InputBorder.none),
                maxLines: 20,
                maxLength: 150,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
