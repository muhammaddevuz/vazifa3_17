// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      price: (json['price'] as num).toDouble(),
      buyCheck: json['buyCheck'] as bool,
      basketCheck: json['basketCheck'] as bool,
      courseId: json['courseId'] as String,
      description: json['description'] as String,
      title: json['title'] as String,
      quizes: (json['quizes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Quiz.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'buyCheck': instance.buyCheck,
      'price': instance.price,
      'courseId': instance.courseId,
      'description': instance.description,
      'title': instance.title,
      'quizes': instance.quizes,
    };
