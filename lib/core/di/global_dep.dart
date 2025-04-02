import 'package:shelter_ai/data/repositories/gpt_api.dart';
import 'package:shelter_ai/data/repositories/gpt_repository_mock.dart';
import 'package:shelter_ai/domain/bloc/app_settings_cubit.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

class GlobalDepHolder {
  GlobalDepContainer? _container;
  bool _isCreated = false;

  GlobalDepContainer? get container => _container;
  bool get isCreated => _isCreated;

  void create({required bool isMock}) {
    _container = isMock ? GlobalDepContainer.mock() : GlobalDepContainer.real();
    _isCreated = true;
  }

  void dispose() {
    if (_container != null){
      _container = null;
    }
    _isCreated = false;
  }
}

class GlobalDepContainer {
  final GptRepository gptRepository;
  final AppSettingsCubit appSettingsCubit;

  GlobalDepContainer._({
    required this.gptRepository,
    required this.appSettingsCubit,
  });

  factory GlobalDepContainer.mock() {
    var gptRepository = GptRepositoryMock();
    var appSettingsCubit = AppSettingsCubit();

    return GlobalDepContainer._(
      gptRepository: gptRepository,
      appSettingsCubit: appSettingsCubit,
    );
  }

  factory GlobalDepContainer.real() {
    var gptRepository = GptRepositoryImpl();
    var appSettingsCubit = AppSettingsCubit();

    return GlobalDepContainer._(
      gptRepository: gptRepository,
      appSettingsCubit: appSettingsCubit,
    );
  }
}
