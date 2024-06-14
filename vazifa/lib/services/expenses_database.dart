import 'package:dars_3_9_uy_ishi/model/note.dart';
import 'package:dars_3_9_uy_ishi/services/local_database.dart';

class NotesDatabase {
  final _localDatabase = LocalDatabase();
  final _tableName = "notes";

  Future<List<Note>> getNote() async {
    final db = await _localDatabase.database;
    final rows = await db.query(_tableName);
    List<Note> note = [];

    for (var row in rows) {
      note.add(
        Note.fromMap(row),
      );
    }

    return note;
  }

  Future<void> addNote(Map<String, dynamic> noteData) async {
    final db = await _localDatabase.database;
    await db.insert(_tableName, noteData);
  }

  Future<void> editNote(int id, Map<String, dynamic> noteData) async {
    final db = await _localDatabase.database;
    await db.update(
      _tableName,
      noteData,
      where: "id = $id",
    );
  }

  Future<void> deleteNote(int id) async {
    final db = await _localDatabase.database;
    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
