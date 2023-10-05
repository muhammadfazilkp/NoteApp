import 'package:hive/hive.dart';
import 'package:note_app/model/model.dart';

class CustomNoteAdapter extends TypeAdapter<Note> {
  // final String customArgument;

  CustomNoteAdapter();

  @override
  int get typeId => 0;

  @override
  Note read(BinaryReader reader) {
    // Implement the deserialization logic here'
    final title = reader.readString();
  final content = reader.readString();
  return Note(title: title, content: content);
    
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    // Implement the serialization logic here
    // You can access customArgument within this method if needed.
  }
}
