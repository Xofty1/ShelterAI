import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_decoder.freezed.dart';
part 'json_decoder.g.dart';

@freezed
sealed class Story with _$Story{
  @JsonSerializable(explicitToJson: true)
  const factory Story({
    required int player_amount,
    required String language,
    required bool family_mode,
    required String wishes,
    required DisasterJs disaster,
    required String short_description,
    required Bunker bunker
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

@freezed
sealed class Bunker with _$Bunker{
  @JsonSerializable(explicitToJson: true)
  const factory Bunker({
    required String name,
    required String location,
    required String capacity,
    required List<String> rooms,
    required List<String> resources
  }) = _Bunker;

  factory Bunker.fromJson(Map<String, dynamic> json) => _$BunkerFromJson(json);
}

@freezed
sealed class DisasterJs with _$DisasterJs{
  @JsonSerializable(explicitToJson: true)
  const factory DisasterJs({
    required String name,
    required String history,
    required String distribution,
    required String world_situation
  }) = _DisasterJs;

  factory DisasterJs.fromJson(Map<String, dynamic> json) => _$DisasterJsFromJson(json);
}

@freezed
sealed class PlayersJs with _$PlayersJs{
  @JsonSerializable(explicitToJson: true)
  const factory PlayersJs({
    required List<Map<String, dynamic>> player_cards,
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
    required String hobby_skills,
    required String phobias,
    required String baggage,
    required String additional_information
  }) = _PlayerCard;

  factory PlayerCard.fromJson(Map<String, dynamic> json) => _$PlayerCardFromJson(json);
}
