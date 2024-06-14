import 'package:flutter/material.dart';
import '../../controllers/todo_controller.dart';
import '../../model/todo.dart';

// ignore: must_be_immutable
class ToDoItem extends StatefulWidget {
  final Function() onDelete;
  final Function() edit;
  final Function() changeposition;
  final ToDo todo;
  const ToDoItem(this.todo,
      {super.key,
      required this.onDelete,
      required this.changeposition,
      required this.edit});

  @override
  // ignore: no_logic_in_create_state
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  final TodoController toDoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.changeposition,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.yellow),
          child: ListTile(
            leading: widget.todo.isCompleted
                ? const Icon(
                    Icons.circle_outlined,
                    color: Colors.blue,
                  )
                : const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
            title: Text(widget.todo.title,
                style: widget.todo.isCompleted
                    ? const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
                    : const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
            subtitle: Text(widget.todo.description,
                style: widget.todo.isCompleted
                    ? const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey)
                    : const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: widget.todo.isCompleted ? widget.edit : () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: widget.onDelete,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
