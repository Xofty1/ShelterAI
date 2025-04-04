import 'dart:async';

import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shelter_ai/domain/models/disaster.dart';

class SembastRepository {
  late Database db;
  final disasterStore = intMapStoreFactory.store('disasters');

  static const List<String> storeNames = [
    'profession',
    'bio',
    'health',
    'hobby',
    'phobia',
    'luggage',
    'extra',
  ];

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, 'shelter_ai.db');

    db = await databaseFactoryIo.openDatabase(dbPath);
  }

  StoreRef<int, String> getStoreByName(String storeName) {
    return StoreRef<int, String>(storeName);
  }

  StoreRef<int, String> getStoreByIndex(int index) {
    return StoreRef<int, String>(storeNames[index]);
  }

  Future<void> addString(int storeIndex, String value) async {
    await getStoreByIndex(storeIndex).add(db, value);
  }

  Future<List<String>> getStringList(int storeIndex) async {
    final store = getStoreByIndex(storeIndex);
    final records = await store.find(db);
    return records.map((record) => record.value).toList();
  }

  Future<void> addDisaster(Disaster disaster) async {
    await disasterStore.add(db, disaster.toMap());
  }

  Future<List<Disaster>> getAllDisasters() async {
    final records = await disasterStore.find(db);
    return records.map((record) => Disaster.fromMap(record.value)).toList();
  }
}
