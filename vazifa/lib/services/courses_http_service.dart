import "dart:convert";

import "package:dars_3_9_uy_ishi/model/course.dart";
import "package:http/http.dart" as http;

class CoursesHttpService {
  Future<Course> getCourses() async {
    Uri url = Uri.parse(
        "https://oy-3-dars-6-default-rtdb.firebaseio.com/courses.json");

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      return Course.fromJson(data);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return Course(
        title: "title",
        description: "description",
        imageUrl: "imageUrl",
        lessons: <String, dynamic>{});
  }
}
