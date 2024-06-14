import 'package:dars_3_9_uy_ishi/model/course.dart';
import 'package:dars_3_9_uy_ishi/model/lesson.dart';
import 'package:dars_3_9_uy_ishi/services/courses_http_service.dart';
import 'package:dars_3_9_uy_ishi/utils/app_constants.dart';

class CourseController {
  CoursesHttpService coursesHttpService = CoursesHttpService();
  Future<Course> course() async {
    Course course = await coursesHttpService.getCourses();
    return course;
  }

  void getLessons(Map lessonsMap) {
    List<Lesson> lessons = [];
    lessonsMap.forEach((key, value) {
      lessons.add(Lesson.fromJson(value));
    });
    if (AppConstants.lessons.isEmpty) {
      AppConstants.lessons = lessons;
    }
  }
}
