import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

@freezed
abstract class AppSettings with _$AppSettings{
  factory AppSettings({
    required int volume,
    required int music,
    required int effects,
    required String loc,
  }) = _AppSettings;
}
