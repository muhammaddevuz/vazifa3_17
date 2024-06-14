import 'package:dars_3_9_uy_ishi/model/quiz.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson {
  bool buyCheck;
  bool basketCheck;
  double price;
  String courseId;
  String description;
  String title;
  Map<String, Quiz> quizes;

  Lesson(
      {
      required this.basketCheck,
      required this.price,
      required this.buyCheck,
      required this.courseId,
      required this.description,
      required this.title,
      required this.quizes});

  static Lesson fromJson(Map<String, dynamic> json) {
    return _$LessonFromJson(json);
  }

  toJson() {
    return _$LessonToJson(this);
  }
}
