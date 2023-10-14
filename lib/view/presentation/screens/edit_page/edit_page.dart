import 'package:flutter/material.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:note_app/model/model.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CrudOpretion>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'subject',
                      label: Icon(Icons.notes),
                    ),
                    maxLines: null,
                    controller: value.editTitleController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'content',
                      label: Icon(Icons.content_paste),
                    ),
                    maxLines: null,
                    controller: value.editContentController,
                  ),
                 
                ],
              ),
            ),
          ),
          floatingActionButton: Consumer<CrudOpretion>(
            builder: (context, value, child) => FloatingActionButton(
              onPressed: () {
                value.updateNote(Note(
                    title: value.editTitleController.text,
                    content: value.editContentController.text));
                    Navigator.pop(context);
              },
              child:
                  const Icon(Icons.save), // You can change the icon as needed
            ),
          ),
        );
      },
    );
  }
}
