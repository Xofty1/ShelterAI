import 'package:freezed_annotation/freezed_annotation.dart';
part 'disaster.freezed.dart';

@freezed
abstract class Disaster with _$Disaster {
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

  factory Disaster.fromMap(Map<String, dynamic> map) {
    return Disaster(
      name: map['name'] as String,
      disasterDescription: map['disasterDescription'] as String,
      disasterShortDescription: map['disasterShortDescription'] as String,
      shelterName: map['shelterName'] as String,
      location: map['location'] as String,
      description: map['description'] as String,
      capacity: map['capacity'] as int,
      rooms: List<String>.from(map['rooms'] as List),
      resources: List<String>.from(map['resources'] as List),
      answer: map['answer'] as String,
    );
  }

}

extension Mapping on Disaster{
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'disasterDescription': disasterDescription,
      'disasterShortDescription': disasterShortDescription,
      'shelterName': shelterName,
      'location': location,
      'description': description,
      'capacity': capacity,
      'rooms': rooms,
      'resources': resources,
      'answer': answer,
    };
  }
}