import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/model/model.dart';

class CrudOpretion extends ChangeNotifier {
  static const String noteApp = 'notes';

  Future<Box<Note>> openBox() async {
    return await Hive.openBox<Note>(noteApp);
  }

  Future<void> addNote(Note note) async {
    final box = await openBox();
    await box.add(note);
  }

  Future<void> deleteNote(int index) async {
    final box = await openBox();
    await box.deleteAt(index);
  }
  Future<List<Note>>getNotes()async{
    final box=await openBox();
    return box.values.toList();

  }

}
