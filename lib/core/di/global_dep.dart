import 'package:audioplayers/audioplayers.dart';
import 'package:shelter_ai/data/repositories/firebase_repository.dart';
import 'package:shelter_ai/data/repositories/gpt_api.dart';
import 'package:shelter_ai/data/repositories/gpt_repository_mock.dart';
import 'package:shelter_ai/domain/bloc/app_settings_cubit.dart';
import 'package:shelter_ai/domain/bloc/sound_cubit.dart';
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
    if (_container != null) {
      _container = null;
    }
    _isCreated = false;
  }
}

class GlobalDepContainer {
  final GptRepository gptRepository;
  final FirebaseRepository firebaseRepository;
  final AppSettingsCubit appSettingsCubit;
  final SoundCubit soundCubit;

  GlobalDepContainer._({
    required this.gptRepository,
    required this.appSettingsCubit,
    required this.soundCubit,
    required this.firebaseRepository,
  });

  factory GlobalDepContainer.mock() {
    var gptRepository = GptRepositoryMock();
    var firebaseRepository = FirebaseRepository();
    var appSettingsCubit = AppSettingsCubit();

    var musicPlayer = AudioPlayer();
    var effectsPlayer = AudioPlayer();

    var soundCubit = SoundCubit(
      musicPlayer: musicPlayer,
      effectsPlayer: effectsPlayer,
      initialMusicVolume: appSettingsCubit.state.settings.music,
      initialEffectsVolume: appSettingsCubit.state.settings.effects,
    );

    return GlobalDepContainer._(
      gptRepository: gptRepository,
      appSettingsCubit: appSettingsCubit,
      soundCubit: soundCubit, firebaseRepository: firebaseRepository,
    );
  }

  factory GlobalDepContainer.real() {
    var gptRepository = GptRepositoryImpl();
    var firebaseRepository = FirebaseRepository();
    var appSettingsCubit = AppSettingsCubit();

    var musicPlayer = AudioPlayer();
    var effectsPlayer = AudioPlayer();

    var soundCubit = SoundCubit(
      musicPlayer: musicPlayer,
      effectsPlayer: effectsPlayer,
      initialMusicVolume: appSettingsCubit.state.settings.music,
      initialEffectsVolume: appSettingsCubit.state.settings.effects,
    );

    return GlobalDepContainer._(
      gptRepository: gptRepository,
      appSettingsCubit: appSettingsCubit,
      soundCubit: soundCubit, firebaseRepository: firebaseRepository,
    );
  }
}
