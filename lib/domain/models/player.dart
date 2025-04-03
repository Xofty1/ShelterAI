import 'package:freezed_annotation/freezed_annotation.dart';
part 'player.freezed.dart';

@freezed
abstract class Player with _$Player {
  const factory Player({
    required String name,
    required LifeStatus lifeStatus,
    required String profession,
    required String bio,
    required String health,
    required String hobby,
    required String phobia,
    required String luggage,
    required String extra,
  }) = _Player;
}

enum LifeStatus {
  alive,
  last,
  killed,
}
