// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicWrapper _$TopicWrapperFromJson(Map<String, dynamic> json) {
  return TopicWrapper(
    topicName: json['topicName'] as String,
    isSelected: json['isSelected'] as bool,
  );
}

Map<String, dynamic> _$TopicWrapperToJson(TopicWrapper instance) =>
    <String, dynamic>{
      'topicName': instance.topicName,
      'isSelected': instance.isSelected,
    };
