
import 'package:freezed_annotation/freezed_annotation.dart';

part 'round_info.freezed.dart';

@freezed
abstract class RoundInfo with _$RoundInfo{
  const factory RoundInfo({
    required int roundNumber,
    required int kickedCount,
    required int openCount,
  }) = _RoundInfo;
}

RoundInfo getRoundInfo(int roundNumber, int playersCount) {
  switch (roundNumber) {
    case 1:
      return RoundInfo(roundNumber: roundNumber, kickedCount: 0, openCount: 1);
    case 2:
      int kickedCount = 0;
      if (playersCount > 6 && playersCount < 15) {
        kickedCount = 1;
      } else if (playersCount >= 15) {
        kickedCount = 2;
      }
      return RoundInfo(roundNumber: roundNumber, kickedCount: kickedCount, openCount: 1);
    case 3:
      int kickedCount = 0;
      if (playersCount > 4 && playersCount < 13) {
        kickedCount = 1;
      } else if (playersCount >= 13) {
        kickedCount = 2;
      }
      return RoundInfo(roundNumber: roundNumber, kickedCount: kickedCount, openCount: 1);
    case 4:
      int kickedCount = 1;
      if (playersCount > 10) {
        kickedCount = 2;
      }
      return RoundInfo(roundNumber: roundNumber, kickedCount: kickedCount, openCount: 1);
    case 5:
      int kickedCount = 1;
      if (playersCount > 8) {
        kickedCount = 2;
      }
      return RoundInfo(roundNumber: roundNumber, kickedCount: kickedCount, openCount: 1);
    default:
      return RoundInfo(roundNumber: roundNumber, kickedCount: 0, openCount: 0);
  }
}