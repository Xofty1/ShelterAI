import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shelter_ai/data/entities/json_story.dart';

part 'json_offline.freezed.dart';
part 'json_offline.g.dart';

@freezed
sealed class DataReader with _$DataReader {
  @JsonSerializable(explicitToJson: true)
  const factory DataReader({
    required Family ru,
    required Family en,
  }) = _DataReader;

  factory DataReader.fromJson(Map<String, dynamic> json) =>
      _$DataReaderFromJson(json);
}

@freezed
sealed class Family with _$Family {
  @JsonSerializable(explicitToJson: true)
  const factory Family({
    required List<Story> no,
    required List<Story> yes,
  }) = _Family;

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);
}
