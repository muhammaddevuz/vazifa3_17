import 'package:dars_3_9_uy_ishi/model/note.dart';
import 'package:flutter/material.dart';

class ManageNoteScreen extends StatefulWidget {
  const ManageNoteScreen({super.key});

  @override
  State<ManageNoteScreen> createState() => _ManageNoteScreenState();
}

class _ManageNoteScreenState extends State<ManageNoteScreen> {
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> noteData = {};

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pop(context, noteData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final expense = ModalRoute.of(context)!.settings.arguments as Note?;
    if (expense != null) {
      noteData = {
        "title": expense.title,
        "subTitle": expense.subTitle,
      };
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          expense == null ? "Note yaratish" : "Note tahrirlash",
        ),
        actions: [
          IconButton(
            onPressed: submit,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              initialValue: noteData['title'],
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Note nomi",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos Note nomini kiriting";
                }

                return null;
              },
              onSaved: (value) {
                noteData['title'] = value;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: noteData['subTitle']?.toString(),
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Note tavsifi",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos Note tavsifi kiriting";
                }

                return null;
              },
              onSaved: (value) {
                noteData['subTitle'] = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
