import 'package:freezed_annotation/freezed_annotation.dart';
part 'player.freezed.dart';

@freezed
abstract class Player with _$Player {
  const factory Player({
    required int id,
    required String name,
    required String profession,
    required String bio,
    required String health,
    required String hobby,
    required String phobia,
    required String luggage,
    required String extra,
    required LifeStatus lifeStatus,
    required List<bool> knownProperties,
    required List<String> notes,
  }) = _Player;
}

enum LifeStatus {
  alive,
  last,
  killed,
}
