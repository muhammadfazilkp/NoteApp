import 'package:flutter/material.dart';
import 'package:note_app/controller/adding_notes/crud.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Consumer<CrudOpretion>(
        builder: (context, value, child) => Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/fasil.png'), fit: BoxFit.cover)),
          child: Card(
            child: Column(
              children: [
                TextField(
                  maxLines: null,
                  controller: value.editTitleController,
                ),
                TextField(
                  maxLines: null,
                  controller: value.editContentController,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
