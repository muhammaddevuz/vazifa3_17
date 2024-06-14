import 'package:flutter/material.dart';
import '../../controllers/todo_controller.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/todo_add_dialog.dart';
import '../widgets/todo_edit_dialog.dart';
import '../widgets/todo_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final TodoController toDoController = TodoController();

  void delete(int index) {
    toDoController.delete(index);
    setState(() {});
  }

  void edit(int index) async {
    Map<String, dynamic>? data = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return const ToDoEditDialog();
        });

    if (data != null) {
      toDoController.edit(index, data['title'], data['description']);
      setState(() {});
    }
  }

  void changeposition(int index) {
    toDoController.changeposition(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.todo,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
          itemCount: toDoController.lst.length,
          itemBuilder: (ctx, index) {
            return ToDoItem(
              toDoController.lst[index],
              edit: () => edit(index),
              onDelete: () => delete(index),
              changeposition: () => changeposition(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic>? data = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return const ToDoAddDialog();
              });
          if (data != null) {
            toDoController.add(toDoController.lst.last.id + 1, data['title'],
                data['description'], DateTime.now(), true);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
