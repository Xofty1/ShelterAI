import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:shelter_ai/data/repositories/gpt_api.dart';
import 'package:shelter_ai/data/repositories/gpt_repository_mock.dart';
import 'package:shelter_ai/data/repositories/sembast_repository.dart';
import 'package:shelter_ai/domain/bloc/app_settings_cubit.dart';
import 'package:shelter_ai/domain/bloc/sound_cubit.dart';
import 'package:shelter_ai/domain/services/cache_service.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';

import '../../domain/services/flutter_tts.dart';

class GlobalDepHolder {
  GlobalDepContainer? _container;
  bool _isCreated = false;

  GlobalDepContainer? get container => _container;

  bool get isCreated => _isCreated;

  Future<void> create({required bool isMock}) async {
    _container = isMock ? await GlobalDepContainer.mock() : await GlobalDepContainer.real();
    _isCreated = true;
  }

  void dispose() {
    if (_container != null) {
      _container!.dispose();
      _container = null;
    }
    _isCreated = false;
  }
}

class GlobalDepContainer {
  final GptRepository gptRepository;
  final AppSettingsCubit appSettingsCubit;
  final SoundCubit soundCubit;

  final AppLifecycleListener appLifecycleListener;

  final SembastRepository sembastRepository;
  final CacheService cacheService;

  GlobalDepContainer._({
    required this.gptRepository,
    required this.appSettingsCubit,
    required this.soundCubit,
    required this.appLifecycleListener,
    required this.sembastRepository,
    required this.cacheService,
  });

  static Future<GlobalDepContainer> mock() async {
    final sembastRepository = SembastRepository();
    await sembastRepository.init();

    final cacheService = CacheService(sembastRepository);

    final gptRepository = GptRepositoryMock();
    final appSettingsCubit = AppSettingsCubit();

    final musicPlayer = AudioPlayer();
    final effectsPlayer = AudioPlayer();
    final tts = Tts();

    final soundCubit = SoundCubit(
      musicPlayer: musicPlayer,
      effectsPlayer: effectsPlayer,
      tts: tts,
    );

    final appLifecycleListener = AppLifecycleListener(onHide: () {
      soundCubit.saveCurrentStatus();
      soundCubit.pauseText();
      soundCubit.pauseMusic();
    }, onResume: () {
      final isMusicPlaying = soundCubit.state.musicIsPlaying;
      final isDubbingPlaying = soundCubit.state.dubbingIsPlaying;

      if (isDubbingPlaying) soundCubit.resumeText();
      if (isMusicPlaying) soundCubit.resumeMusic();
    });

    return GlobalDepContainer._(
      gptRepository: gptRepository,
      appSettingsCubit: appSettingsCubit,
      soundCubit: soundCubit,
      appLifecycleListener: appLifecycleListener,
      sembastRepository: sembastRepository,
      cacheService: cacheService,
    );
  }

  static Future<GlobalDepContainer> real() async {
    final sembastRepository = SembastRepository();
    await sembastRepository.init();

    final cacheService = CacheService(sembastRepository);

    final gptRepository = GptRepositoryImpl();
    final appSettingsCubit = AppSettingsCubit();

    final musicPlayer = AudioPlayer();
    final effectsPlayer = AudioPlayer();
    final tts = Tts();

    var soundCubit = SoundCubit(
      musicPlayer: musicPlayer,
      effectsPlayer: effectsPlayer,
      tts: tts,
    );

    final appLifecycleListener = AppLifecycleListener(onHide: () {
      soundCubit.saveCurrentStatus();
      soundCubit.pauseText();
      soundCubit.pauseMusic();
    }, onResume: () {
      final isMusicPlaying = soundCubit.state.musicIsPlaying;
      final isDubbingPlaying = soundCubit.state.dubbingIsPlaying;

      if (isDubbingPlaying) soundCubit.resumeText();
      if (isMusicPlaying) soundCubit.resumeMusic();
    });

    return GlobalDepContainer._(
      gptRepository: gptRepository,
      appSettingsCubit: appSettingsCubit,
      soundCubit: soundCubit,
      appLifecycleListener: appLifecycleListener,
      sembastRepository: sembastRepository,
      cacheService: cacheService,
    );
  }

  void dispose() {
    appLifecycleListener.dispose();
  }
}
