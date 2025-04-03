import 'package:freezed_annotation/freezed_annotation.dart';
part 'disaster.freezed.dart';

@freezed
abstract class Disaster with _$Disaster{
  const factory Disaster({
    required String name,
    required String disasterDescription,
    required String disasterShortDescription,
    required String shelterName,
    required String location,
    required String description,
    required int capacity,
    required List<String> rooms,
    required List<String> resources,
    required String answer,
  }) = _Disaster;
}