import 'package:json_annotation/json_annotation.dart';
import 'package:lernhelfer/core/enums/learn_request_status.dart';

part 'learn_requests.g.dart';

@JsonSerializable()
class LearnRequest {
  @JsonKey(name: "learnRequestId")
  final String learnRequestId;
  @JsonKey(name: "lastModificationDate")
  final DateTime lastModificationDate;
  @JsonKey(name: "studentUid")
  final String studentUid;
  @JsonKey(name: "subject")
  final String subject;
  @JsonKey(name: "topics")
  final List<String> topics;
  //TODO type correct?
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "question")
  final String question;
  @JsonKey(name: "status")
  final LearnRequestStatus status;
  @JsonKey(name: "messages")
  final List<String> messages;

  LearnRequest(
      {this.learnRequestId,
      this.lastModificationDate,
      this.studentUid,
      this.subject,
      this.topics,
      this.image,
      this.question,
      this.status,
      this.messages});

  factory LearnRequest.fromJson(Map<String, dynamic> json) =>
      _$LearnRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LearnRequestToJson(this);
}
