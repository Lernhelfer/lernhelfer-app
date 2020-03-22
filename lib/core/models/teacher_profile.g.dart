// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherProfile _$TeacherProfileFromJson(Map<String, dynamic> json) {
  return TeacherProfile(
    teacherUid: json['teacherUid'] as String,
    teacherDetails: json['teacherDetails'] == null
        ? null
        : TeacherDetails.fromJson(
            json['teacherDetails'] as Map<String, dynamic>),
    helpCount: json['helpCount'] as int,
  );
}

Map<String, dynamic> _$TeacherProfileToJson(TeacherProfile instance) =>
    <String, dynamic>{
      'teacherUid': instance.teacherUid,
      'teacherDetails': instance.teacherDetails,
      'helpCount': instance.helpCount,
    };
