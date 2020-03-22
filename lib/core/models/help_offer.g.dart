// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpOffer _$HelpOfferFromJson(Map<String, dynamic> json) {
  return HelpOffer(
    helpOfferId: json['helpOfferId'] as String,
    teacherUid: json['teacherUid'] as String,
    messages: (json['messages'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$HelpOfferToJson(HelpOffer instance) => <String, dynamic>{
      'helpOfferId': instance.helpOfferId,
      'teacherUid': instance.teacherUid,
      'messages': instance.messages,
    };
