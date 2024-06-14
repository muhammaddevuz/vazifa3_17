import 'package:dars_3_9_uy_ishi/model/note.dart';
import 'package:dars_3_9_uy_ishi/view_model/expenses_viewmode.dart';
import 'package:dars_3_9_uy_ishi/views/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final notesViewModel = NotesViewmodel();

  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
  }

  void addNote() async {
    final response = await Navigator.pushNamed(context, "/manage");

    if (response != null) {
      await notesViewModel.addNote(
          (response as Map)['title'], response['subTitle']);
      setState(() {});
    }
  }

  void editNote(Note note) async {
    final response =
        await Navigator.pushNamed(context, "/manage", arguments: note);

    if (response != null) {
      await notesViewModel.editNote(
        note.id,
        (response as Map)['title'],
        response['subTitle'],
      );
      setState(() {});
    }
  }

  void deleteNote(Note note) async {
    final response = await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Ishonchingiz komilmi?"),
          content: Text("Siz ${note.title} ni o'chirmoqchisiz."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Bekor qilish"),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("Ha, ishonchim komil"),
            ),
          ],
        );
      },
    );

    if (response) {
      await notesViewModel.deleteNote(note.id);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.note),
        actions: [
          IconButton(
            onPressed: addNote,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: notesViewModel.list(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                final notes = snapshot.data;
                return notes == null || notes.isEmpty
                    ? const Center(
                        child: Text("Note mavjud emas."),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: notes.length,
                        itemBuilder: (ctx, index) {
                          return NoteItem(
                            note: notes[index],
                            onEdit: () {
                              editNote(notes[index]);
                            },
                            onDelete: () {
                              deleteNote(notes[index]);
                            },
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
