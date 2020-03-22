// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_subjects_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicSubjectsWrapper _$TopicSubjectsWrapperFromJson(Map<String, dynamic> json) {
  return TopicSubjectsWrapper(
    data: (json['data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
  );
}

Map<String, dynamic> _$TopicSubjectsWrapperToJson(
        TopicSubjectsWrapper instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
