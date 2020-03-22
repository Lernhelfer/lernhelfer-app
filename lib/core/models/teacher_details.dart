import 'package:json_annotation/json_annotation.dart';

part 'teacher_details.g.dart';

@JsonSerializable()
class TeacherDetails {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "profileImageUrl")
  final String profileImageUrl;
  @JsonKey(name: "subjects")
  final Map<String, List<int>> subjects;
  @JsonKey(name: "communicationMethods")
  final List<String> communicationMethods;

  TeacherDetails(
      {this.name,
      this.profileImageUrl,
      this.subjects,
      this.communicationMethods});

  factory TeacherDetails.fromJson(Map<String, dynamic> json) =>
      _$TeacherDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherDetailsToJson(this);
}
