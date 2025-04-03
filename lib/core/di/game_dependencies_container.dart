import 'package:shelter_ai/data/repositories/gpt_api.dart';
import 'package:shelter_ai/data/repositories/gpt_repository_mock.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

class GameDependenciesContainer {

  final GptRepository gptRepository;

  const GameDependenciesContainer({
    required this.gptRepository,
  });

  GameDependenciesContainer.mock():
      gptRepository = GptRepositoryMock();

  GameDependenciesContainer.impl():
      gptRepository = GptRepositoryImpl();
}