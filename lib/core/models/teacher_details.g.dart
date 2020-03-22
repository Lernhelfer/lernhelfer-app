// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherDetails _$TeacherDetailsFromJson(Map<String, dynamic> json) {
  return TeacherDetails(
    name: json['name'] as String,
    profileImageUrl: json['profileImageUrl'] as String,
    subjects: (json['subjects'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as int)?.toList()),
    ),
    communicationMethods: (json['communicationMethods'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$TeacherDetailsToJson(TeacherDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'subjects': instance.subjects,
      'communicationMethods': instance.communicationMethods,
    };
