import 'package:json_annotation/json_annotation.dart';
import 'package:lernhelfer/core/models/teacher_details.dart';

part 'teacher_profile.g.dart';

@JsonSerializable()
class TeacherProfile {
  @JsonKey(name: "teacherUid")
  final String teacherUid;
  @JsonKey(name: "teacherDetails")
  final TeacherDetails teacherDetails;
  @JsonKey(name: "helpCount")
  final int helpCount;

  TeacherProfile({this.teacherUid, this.teacherDetails, this.helpCount});

  factory TeacherProfile.fromJson(Map<String, dynamic> json) =>
      _$TeacherProfileFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherProfileToJson(this);
}
