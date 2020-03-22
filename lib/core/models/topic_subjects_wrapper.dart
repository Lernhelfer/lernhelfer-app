import 'package:json_annotation/json_annotation.dart';

part 'topic_subjects_wrapper.g.dart';

@JsonSerializable()
class TopicSubjectsWrapper {
  final Map<String, List<String>> data;

  TopicSubjectsWrapper({this.data});

  factory TopicSubjectsWrapper.fromJson(Map<String, dynamic> json) =>
      _$TopicSubjectsWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$TopicSubjectsWrapperToJson(this);
}
