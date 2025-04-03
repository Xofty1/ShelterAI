import 'package:audioplayers/audioplayers.dart';
import 'package:shelter_ai/data/repositories/gpt_api.dart';
import 'package:shelter_ai/data/repositories/gpt_repository_mock.dart';
import 'package:shelter_ai/domain/bloc/app_settings_cubit.dart';
import 'package:shelter_ai/domain/bloc/sound_cubit.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../../domain/services/flutter_tts.dart';

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
    if (_container != null) {
      _container = null;
    }
    _isCreated = false;
  }
}

class GlobalDepContainer {
  final GptRepository gptRepository;
  final AppSettingsCubit appSettingsCubit;
  final SoundCubit soundCubit;

  GlobalDepContainer._({
    required this.gptRepository,
    required this.appSettingsCubit,
    required this.soundCubit,
  });

  factory GlobalDepContainer.mock() {
    final gptRepository = GptRepositoryMock();
    final appSettingsCubit = AppSettingsCubit();

    final musicPlayer = AudioPlayer();
    final effectsPlayer = AudioPlayer();
    final tts = Tts();

    var soundCubit = SoundCubit(
      musicPlayer: musicPlayer,
      effectsPlayer: effectsPlayer,
      tts: tts,
    );

    return GlobalDepContainer._(
      gptRepository: gptRepository,
      appSettingsCubit: appSettingsCubit,
      soundCubit: soundCubit,
    );
  }

  factory GlobalDepContainer.real() {
    final gptRepository = GptRepositoryMock();
    final appSettingsCubit = AppSettingsCubit();

    final musicPlayer = AudioPlayer();
    final effectsPlayer = AudioPlayer();
    final tts = Tts();

    var soundCubit = SoundCubit(
      musicPlayer: musicPlayer,
      effectsPlayer: effectsPlayer,
      tts: tts,
    );

    return GlobalDepContainer._(
      gptRepository: gptRepository,
      appSettingsCubit: appSettingsCubit,
      soundCubit: soundCubit,
    );
  }
}
