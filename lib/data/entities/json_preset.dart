import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_preset.freezed.dart';
part 'json_preset.g.dart';

@freezed
sealed class Preset with _$Preset {
  @JsonSerializable(explicitToJson: true)
  const factory Preset({
    required Characteristics ru,
    required Characteristics en,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}

@freezed
sealed class Characteristics with _$Characteristics {
  @JsonSerializable(explicitToJson: true)
  const factory Characteristics(
      {required List<String> profession,
      required List<String> age,
      required List<String> health,
      @JsonKey(name: 'hobby_skills') required List<String> hobbySkills,
      required List<String> phobias,
      required List<String> baggage,
      @JsonKey(name: 'additional_information')
      required String additionalInformation}) = _Characteristics;

  factory Characteristics.fromJson(Map<String, dynamic> json) =>
      _$CharacteristicsFromJson(json);
}
