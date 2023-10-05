import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/model/model.dart';

class CrudOpretion extends ChangeNotifier {
  static const String noteApp = 'notes';
  TextEditingController titleController=TextEditingController();
  TextEditingController contentController =TextEditingController();

  Future<Box<Note>> openBox() async {
    return await Hive.box<Note>(noteApp);
  }

  Future<void> addNote(Note note) async {
    final box = await openBox();
    await box.add(note);
    notifyListeners();
  }

  Future<void> deleteNote(int index) async {
    final box = await openBox();
    await box.deleteAt(index);
    notifyListeners();
  }
  Future<List<Note>>getNotes()async{
    final box=await openBox();
    return box.values.toList();
    
    

  }

}
