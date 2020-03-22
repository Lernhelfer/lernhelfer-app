import 'package:json_annotation/json_annotation.dart';

part 'topic_wrapper.g.dart';

@JsonSerializable()
class TopicWrapper {
  String topicName;
  bool isSelected;
  TopicWrapper({this.topicName, this.isSelected = false});

  factory TopicWrapper.fromJson(Map<String, dynamic> json) =>
      _$TopicWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$TopicWrapperToJson(this);
}
