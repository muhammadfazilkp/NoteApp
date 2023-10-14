
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:note_app/model/model.dart';
import 'package:provider/provider.dart';

class DataFeatch extends StatelessWidget {
  const DataFeatch({
    Key? key,
    required this.note,
    required this.currentDate,
    required this.index, // Add the index parameter
  });

  final Note note;
  final String currentDate;
  final int index; // Add the index property

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<CrudOpretion>(
            builder: (context, value, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Checkbox(
                        value: note.taskCompleted,
                        onChanged: (newValue) {
                          value.updateTaskCompletion(index, newValue ?? true);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        note.title,
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          decoration: note.taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              note.content,
              style: GoogleFonts.poppins(
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              ' $currentDate',
              style: GoogleFonts.poppins(),
            ),
          ),
        ],
      ),
    );
  }
}