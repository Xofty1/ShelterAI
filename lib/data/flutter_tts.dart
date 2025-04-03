import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;

enum TtsState { playing, stopped, paused, continued }

// Text to speech class
class Tts {
  // Sets default values for Tts
  late FlutterTts flutterTts;
  String language = "ru";
  String? engine;
  double volume = 0.5;
  final pitch = 1.0;
  final rate = 0.9;
  bool isCurrentLanguageInstalled = false;

  String? _VoiceText;

  TtsState ttsState = TtsState.stopped;

  // Sets default states for Tts player
  bool get isPlaying => ttsState == TtsState.playing;
  bool get isStopped => ttsState == TtsState.stopped;
  bool get isPaused => ttsState == TtsState.paused;
  bool get isContinued => ttsState == TtsState.continued;

  // Gets platform
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;


  // Itit function
  dynamic initTts() {
    // Creates player
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    // Creates Handlers
    flutterTts.setStartHandler(() {
      ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
        ttsState = TtsState.stopped;
    });

    flutterTts.setCancelHandler(() {
      ttsState = TtsState.stopped;
    });

    flutterTts.setPauseHandler(() {
        ttsState = TtsState.paused;
    });

    flutterTts.setContinueHandler(() {
        ttsState = TtsState.continued;
    });

    flutterTts.setErrorHandler((msg) {
        ttsState = TtsState.stopped;
    });
  }

  Tts() {
    initTts();
  }


  Future<void> _getDefaultEngine() async {
    await flutterTts.getDefaultEngine;
  }

  Future<void> _getDefaultVoice() async {
    await flutterTts.getDefaultVoice;
  }

  // Updates settings
  Future<void> _updateSettings(volume) async {
    await flutterTts.setVolume(volume);
  }

  // Function that plays _VoiceText
  Future<void> _speak() async {
    Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    if (_VoiceText != null && _VoiceText!.isNotEmpty) {
      await flutterTts.speak(_VoiceText!);
    }
  }

  Future<void> _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  // Stops audio
  Future<void> _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) () => ttsState = TtsState.stopped;
  }

  // Pauses audio
  Future<void> _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) () => ttsState = TtsState.paused;
  }

  // Updates language
  void _updateLanguage(String? lang) {
    // Reforms it
    switch (lang) {
      case "en": lang = "en-US"; break;
      case "ru": lang = "ru-RU"; break;
      default: throw(Error);
    }
    language = lang;
    flutterTts.setLanguage(language);
    if (isAndroid) {
      flutterTts
          .isLanguageInstalled(language)
          .then((value) => isCurrentLanguageInstalled = (value as bool));
    }
  }

  // Updates text
  void _updateText(String text){
    this._VoiceText = text;
  }
}