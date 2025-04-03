import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote_info.freezed.dart';
part 'vote_info.g.dart';

@freezed
abstract class VoteInfo with _$VoteInfo{
  const factory VoteInfo({
    // Голоса (по индексам)
    required List<int> votes,
    // Могут ли быть выбраны в голосовании
    // Необходимо для переголосования, список с информацией:
    // можно выбрать игрока или нельзя
    required List<bool> canBeSelected,
    // Победители голосования (их индексы)
    required List<int> selectedIndexes,
    // Статус голосования
    required VoteStatus voteStatus,
  }) = _VoteInfo;

  factory VoteInfo.fromJson(Map<String, dynamic> json) => _$VoteInfoFromJson(json);
}

enum VoteStatus{
  // В данный момент выборы не происходят
  none,
  // Выборы идут
  running,
  // Происходит переизбрание
  reRunning,
  // Выборы успешны
  successful,
}