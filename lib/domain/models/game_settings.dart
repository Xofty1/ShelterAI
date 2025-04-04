import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_settings.freezed.dart';

@freezed
abstract class GameSettings with _$GameSettings {
  const factory GameSettings({
    required int playersCount,
    required int difficulty,
    required String plot,
    required bool safeMode,
    required String language,
    required int time,
    required bool isTimerEnable
  }) = _GameSettings;
}
