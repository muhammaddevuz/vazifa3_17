import 'package:dars_3_9_uy_ishi/model/lesson.dart';
import 'package:dars_3_9_uy_ishi/views/widgets/lesson.dart';
import 'package:flutter/material.dart';

class SearchViewDelegate extends SearchDelegate<String> {
  final List<Lesson> data;

  SearchViewDelegate(this.data);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? data
        : data
            .where((element) =>
                element.title.toLowerCase().contains(query) ||
                element.toString().contains(query))
            .toList();
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return LessonWidget(lessons: suggestionList);
      },
    );
  }
}
