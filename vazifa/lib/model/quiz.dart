// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'quiz.g.dart';

@JsonSerializable()
class Quiz {
  String question;
  List options;
  int correctIndex;
  bool check;

  Quiz(
      {
      required this.question,
      required this.options,
      required this.correctIndex,required this.check});

  static Quiz fromJson(Map<String, dynamic> json) {
    return _$QuizFromJson(json);
  }

  toJson() {
    return _$QuizToJson(this);
  }
}
