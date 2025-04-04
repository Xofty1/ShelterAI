import 'dart:math';

import '../../data/repositories/sembast_repository.dart';
import '../models/disaster.dart';
import '../models/player.dart';

class CacheService {
  final SembastRepository repository;

  CacheService(this.repository);

  Future<void> saveDisaster(Disaster disaster) async {
    repository.addDisaster(disaster);
  }

  Future<void> savePlayer(Player player) async {
    await repository.addString(0, player.profession);
    await repository.addString(1, player.bio);
    await repository.addString(2, player.health);
    await repository.addString(3, player.hobby);
    await repository.addString(4, player.phobia);
    await repository.addString(5, player.luggage);
    await repository.addString(6, player.extra);
  }

  Future<Disaster> getRandomDisaster() async {
    List<Disaster> list = await repository.getAllDisasters();
    return list[Random().nextInt(list.length - 1)];
  }

  Future<Player> getRandomPlayer(int index) async {
    final random = Random();
    final professions = await repository.getStringList(0);
    final bios = await repository.getStringList(1);
    final healths = await repository.getStringList(2);
    final hobbies = await repository.getStringList(3);
    final phobias = await repository.getStringList(4);
    final luggages = await repository.getStringList(5);
    final extras = await repository.getStringList(6);

    return Player(
        id: index,
        name: (index + 1).toString(),
        profession: professions[random.nextInt(professions.length)],
        bio: bios[random.nextInt(bios.length - 1)],
        health: healths[random.nextInt(healths.length - 1)],
        hobby: hobbies[random.nextInt(hobbies.length - 1)],
        phobia: phobias[random.nextInt(phobias.length - 1)],
        luggage: luggages[random.nextInt(luggages.length - 1)],
        extra: extras[random.nextInt(extras.length - 1)],
        lifeStatus: LifeStatus.alive,
        knownProperties: List.filled(7, false),
        notes: []);
  }
}
