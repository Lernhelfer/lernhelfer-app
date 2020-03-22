import 'package:json_annotation/json_annotation.dart';

part 'help_offer.g.dart';

@JsonSerializable()
class HelpOffer {
  @JsonKey(name: "helpOfferId")
  final String helpOfferId;
  @JsonKey(name: "teacherUid")
  final String teacherUid;
  @JsonKey(name: "messages")
  final List<String> messages;

  HelpOffer({this.helpOfferId, this.teacherUid, this.messages});

  factory HelpOffer.fromJson(Map<String, dynamic> json) =>
      _$HelpOfferFromJson(json);

  Map<String, dynamic> toJson() => _$HelpOfferToJson(this);
}
