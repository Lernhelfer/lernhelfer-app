import 'package:json_annotation/json_annotation.dart';

part 'student_profile.g.dart';

@JsonSerializable()
class StudentProfile {
  @JsonKey(name: "studentUid")
  final String studentUid;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "region")
  final String region;
  @JsonKey(name: "class")
  final int grade;

  StudentProfile({
    this.studentUid,
    this.name,
    this.grade,
    this.region,
  });

  factory StudentProfile.fromJson(Map<String, dynamic> json) =>
      _$StudentProfileFromJson(json);

  Map<String, dynamic> toJson() => _$StudentProfileToJson(this);
}
