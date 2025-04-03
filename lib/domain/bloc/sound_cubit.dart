import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/core/app_shared_preference/app_shared_preference.dart';
import 'package:shelter_ai/core/constants/sound_paths.dart';
import 'package:shelter_ai/domain/services/flutter_tts.dart';

class SoundCubit extends Cubit<SoundState> {
  final AudioPlayer musicPlayer;
  final AudioPlayer effectsPlayer;
  final Tts tts;

  SoundCubit({
    required this.musicPlayer,
    required this.effectsPlayer,
    required this.tts,
  }) : super(SoundState()) {
    _setup();
  }

  Future<void> _setup() async {
    final initialMusicVolume = AppSharedPreference().getMusic();
    final initialEffectsVolume = AppSharedPreference().getEffects();
    final initialDubbingVolume = AppSharedPreference().getDubbing();

    await setMusicVolume(initialMusicVolume ?? 50);
    await setEffectsVolume(initialEffectsVolume ?? 50);
    await setDubbingVolume(initialDubbingVolume ?? 50);

    await effectsPlayer.setAudioContext(AudioContext(
      android: const AudioContextAndroid(audioFocus: AndroidAudioFocus.none),
      iOS:
          AudioContextIOS(options: const {AVAudioSessionOptions.mixWithOthers}),
    ));
    await musicPlayer.setAudioContext(AudioContext(
      android: const AudioContextAndroid(audioFocus: AndroidAudioFocus.none),
      iOS:
          AudioContextIOS(options: const {AVAudioSessionOptions.mixWithOthers}),
    ));
  }

  Future<void> setEffectsVolume(int volume) async {
    await effectsPlayer.setVolume(volume.toDouble() / 100);
  }

  Future<void> setMusicVolume(int volume) async {
    await musicPlayer.setVolume(volume.toDouble() / 100);
  }

  Future<void> setDubbingVolume(int volume) async {
    await tts.setVolume(volume.toDouble() / 100);
  }

  Future<void> playText(String text) async {
    tts.setText(text);
    await tts.speak();
  }

  Future<void> stopText() async {
    await tts.stop();
  }

  Future<void> pauseText() async {
    await tts.pause();
}

  Future<void> playButtonClickEffect() async {
    await effectsPlayer.setSourceAsset(SoundPaths.buttonTap);
    await effectsPlayer.resume();
  }

  Future<void> playCustomEffect(String assetSoundPath) async {
    await effectsPlayer.setSourceAsset(assetSoundPath);
    await effectsPlayer.resume();
  }

  Future<void> playCustomMusic(String assetSoundPath) async {
    await musicPlayer.setSourceAsset(assetSoundPath);
    await musicPlayer.resume();
  }

  Future<void> pauseMusic() async {
    await musicPlayer.pause();
  }
}

class SoundState {}
