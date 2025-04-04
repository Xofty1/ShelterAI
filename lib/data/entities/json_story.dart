import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_story.freezed.dart';
part 'json_story.g.dart';

@freezed
sealed class Story with _$Story {
  @JsonSerializable(explicitToJson: true)
  const factory Story(
      {@JsonKey(name: 'player_amount') required int playerAmount,
      required String language,
      @JsonKey(name: 'family_mode') required bool familyMode,
      required String wishes,
      required DisasterJs disaster,
      @JsonKey(name: 'short_description') required String shortDescription,
      required Bunker bunker}) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

@freezed
sealed class Bunker with _$Bunker {
  @JsonSerializable(explicitToJson: true)
  const factory Bunker(
      {required String name,
      required String location,
      required String capacity,
      required List<String> rooms,
      required List<String> resources}) = _Bunker;

  factory Bunker.fromJson(Map<String, dynamic> json) => _$BunkerFromJson(json);
}

@freezed
sealed class DisasterJs with _$DisasterJs {
  @JsonSerializable(explicitToJson: true)
  const factory DisasterJs(
          {required String name,
          required String history,
          required String distribution,
          @JsonKey(name: 'world_situation') required String worldSituation}) =
      _DisasterJs;

  factory DisasterJs.fromJson(Map<String, dynamic> json) =>
      _$DisasterJsFromJson(json);
}
