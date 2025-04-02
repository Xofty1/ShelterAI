import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/core/constants/sound_paths.dart';

class SoundCubit extends Cubit<SoundState> {
  final AudioPlayer musicPlayer;
  final AudioPlayer effectsPlayer;

  SoundCubit({
    required this.musicPlayer,
    required this.effectsPlayer,
    required int initialMusicVolume,
    required int initialEffectsVolume,
  }) : super(SoundState()) {
    _setup(initialMusicVolume, initialEffectsVolume);
  }

  Future<void> _setup(int initialMusicVolume, int initialEffectsVolume) async {
    await setMusicVolume(initialMusicVolume);
    await setEffectsVolume(initialEffectsVolume);
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
    //await effectsPlayer.pause();
    await effectsPlayer.setVolume(volume.toDouble() / 100);
    //await effectsPlayer.resume();
  }

  Future<void> setMusicVolume(int volume) async {
    //await musicPlayer.pause();
    await musicPlayer.setVolume(volume.toDouble() / 100);
    //await musicPlayer.resume();
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
}

class SoundState {}
