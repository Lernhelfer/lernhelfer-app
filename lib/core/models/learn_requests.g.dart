// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnRequest _$LearnRequestFromJson(Map<String, dynamic> json) {
  return LearnRequest(
    learnRequestId: json['learnRequestId'] as String,
    lastModificationDate: json['lastModificationDate'] == null
        ? null
        : DateTime.parse(json['lastModificationDate'] as String),
    studentUid: json['studentUid'] as String,
    subject: json['subject'] as String,
    topics: (json['topics'] as List)?.map((e) => e as String)?.toList(),
    image: json['image'] as String,
    question: json['question'] as String,
    status: _$enumDecodeNullable(_$LearnRequestStatusEnumMap, json['status']),
    messages: (json['messages'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LearnRequestToJson(LearnRequest instance) =>
    <String, dynamic>{
      'learnRequestId': instance.learnRequestId,
      'lastModificationDate': instance.lastModificationDate?.toIso8601String(),
      'studentUid': instance.studentUid,
      'subject': instance.subject,
      'topics': instance.topics,
      'image': instance.image,
      'question': instance.question,
      'status': _$LearnRequestStatusEnumMap[instance.status],
      'messages': instance.messages,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$LearnRequestStatusEnumMap = {
  LearnRequestStatus.Open: 'Open',
  LearnRequestStatus.OfferSent: 'OfferSent',
  LearnRequestStatus.OfferAccepted: 'OfferAccepted',
  LearnRequestStatus.Closed: 'Closed',
};
