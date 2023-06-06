import 'package:ervin/models/note.dart';
import 'package:hive/hive.dart';


class DatabaseService{
  static const boxName = 'notes';

  Future<void> addNote(Note note) async{
    final box = await Hive.openBox(boxName);
    await box.add(note);
  }
  Future<void> editNote(int key,Note note) async{
    final box = await Hive.openBox(boxName);
    await box.put(key, note);
  }
  Future<List<Note>> getNote(Note note) async{
    final box = await Hive.openBox(boxName);
    return box.get(note.key);
  }
  Future<void> deleteNote(Note note) async{
    final box = await Hive.openBox(boxName);
    await box.delete(note.key);
  }
  
}