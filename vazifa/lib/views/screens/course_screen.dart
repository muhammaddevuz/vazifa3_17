import 'package:dars_3_9_uy_ishi/controllers/course_controller.dart';
import 'package:dars_3_9_uy_ishi/model/course.dart';
import 'package:dars_3_9_uy_ishi/model/lesson.dart';
import 'package:dars_3_9_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_9_uy_ishi/views/screens/basket_page.dart';
import 'package:dars_3_9_uy_ishi/views/widgets/lesson.dart';
import 'package:dars_3_9_uy_ishi/views/widgets/search_view_delegate.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CourseScreen extends StatefulWidget {
  Course course;

  CourseScreen({super.key, required this.course});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  CourseController courseController = CourseController();
  @override
  void initState() {
    courseController.getLessons(widget.course.lessons);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Lesson> filterdData = [];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                String? result = await showSearch(
                    context: context,
                    delegate: SearchViewDelegate(AppConstants.lessons));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.course.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.course.description,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            LessonWidget(lessons: AppConstants.lessons),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BasketPage(
                  course: widget.course,
                ),
              ));
        },
        child: Icon(Icons.shopping_basket_rounded),
      ),
    );
  }
}
