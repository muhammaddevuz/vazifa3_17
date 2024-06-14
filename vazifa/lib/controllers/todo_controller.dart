import 'package:dars_3_9_uy_ishi/model/todo.dart';
import 'package:flutter/material.dart';

class TodoController with ChangeNotifier {
  final List<ToDo> _lst = [
    ToDo(
        id: 0,
        title: "Swimming",
        description: "Swimming",
        date: DateTime.now(),
        isCompleted: true),
    ToDo(
        id: 1,
        title: "Eating",
        description: "Eating",
        date: DateTime.now(),
        isCompleted: true),
  ];

  List<ToDo> get lst {
    return [..._lst];
  }

  int completedTodos() {
    int count = 0;
    for (var element in _lst) {
      if (element.isCompleted) {
        count += 1;
      }
    }
    return count;
  }

  int notCompletedTodos() {
    int count = 0;
    for (var element in _lst) {
      if (!element.isCompleted) {
        count += 1;
      }
    }
    return count;
  }

  void add(int i, String title, String description, DateTime date,
      bool isCompleted) {
    _lst.add(ToDo(
        id: i,
        title: title,
        description: description,
        date: date,
        isCompleted: isCompleted));
  }

  void changeposition(int i) {
    _lst[i].isCompleted = !_lst[i].isCompleted;
  }

  void edit(int i, String title, String description) {
    _lst[i].title = title;
    _lst[i].description = description;
  }

  void delete(int index) {
    _lst.removeAt(index);
  }
}
