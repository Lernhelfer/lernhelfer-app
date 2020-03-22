// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentProfile _$StudentProfileFromJson(Map<String, dynamic> json) {
  return StudentProfile(
    studentUid: json['studentUid'] as String,
    name: json['name'] as String,
    grade: json['class'] as int,
    region: json['region'] as String,
  );
}

Map<String, dynamic> _$StudentProfileToJson(StudentProfile instance) =>
    <String, dynamic>{
      'studentUid': instance.studentUid,
      'name': instance.name,
      'region': instance.region,
      'class': instance.grade,
    };
