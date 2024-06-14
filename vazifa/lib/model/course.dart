// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {

  String title;
  String description;
  String imageUrl;
  Map<String, dynamic> lessons;

  Course(
      {
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.lessons});

  factory Course.fromJson(Map<String, dynamic> json) {
    return _$CourseFromJson(json);
  }

  toJson() {
    return _$CourseToJson(this);
  }
}
