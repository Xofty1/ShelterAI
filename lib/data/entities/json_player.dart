import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_player.freezed.dart';
part 'json_player.g.dart';

@freezed
sealed class PlayersJs with _$PlayersJs{
  @JsonSerializable(explicitToJson: true)
  const factory PlayersJs({
    @JsonKey(name: 'player_cards')
    required List<Map<String, dynamic>> playerCards,
  }) = _PlayersJs;

  factory PlayersJs.fromJson(Map<String, dynamic> json) => _$PlayersJsFromJson(json);
}

@freezed
sealed class PlayerCard with _$PlayerCard{
  @JsonSerializable(explicitToJson: true)
  const factory PlayerCard({
    required String profession,
    required String age,
    required String health,
    @JsonKey(name: 'hobby_skills')
    required String hobbySkills,
    required String phobias,
    required String baggage,
    @JsonKey(name: 'additional_information')
    required String additionalInformation
  }) = _PlayerCard;

  factory PlayerCard.fromJson(Map<String, dynamic> json) => _$PlayerCardFromJson(json);
}
