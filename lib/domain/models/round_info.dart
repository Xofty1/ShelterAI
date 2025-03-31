
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

RoundInfo getRoundInfo(int roundNumber, int playersCount){
  switch(roundNumber){
    case 1:
      switch(playersCount){
        default: return RoundInfo(roundNumber: roundNumber, kickedCount: 1, openCount: 2);
      }
    case 2:
      switch(playersCount){
        default: return RoundInfo(roundNumber: roundNumber, kickedCount: 1, openCount: 1);
      }
    case 3:
      switch(playersCount){
        default: return RoundInfo(roundNumber: roundNumber, kickedCount: 1, openCount: 1);
      }
    case 4:
      switch(playersCount){
        default: return RoundInfo(roundNumber: roundNumber, kickedCount: 2, openCount: 1);
      }
    case 5:
      switch(playersCount){
        default: return RoundInfo(roundNumber: roundNumber, kickedCount: 1, openCount: 1);
      }
  }

  throw Exception('Unexpected round number');
}