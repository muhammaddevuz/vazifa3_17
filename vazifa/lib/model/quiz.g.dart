// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      question: json['question'] as String,
      options: json['options'] as List<dynamic>,
      correctIndex: (json['correctIndex'] as num).toInt(),
      check: json['check'] as bool,
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'correctIndex': instance.correctIndex,
      'check': instance.check,
    };
