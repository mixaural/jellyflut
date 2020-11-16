import 'dart:async';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:jellyflut/api/items.dart';
import 'package:jellyflut/models/item.dart';
import 'package:jellyflut/models/playbackInfos.dart';

class StreamModel extends ChangeNotifier {
  Item _item = Item();
  PlayBackInfos _playBackInfos = PlayBackInfos();
  String _url;
  BetterPlayerController _betterPlayerController;
  int _audioStreamIndex;
  int _subtitleStreamIndex;
  Timer _timer;

  // Singleton
  static final StreamModel _streamProvider = StreamModel._internal();

  Item get item => _item;
  PlayBackInfos get playBackInfos => _playBackInfos;
  String get url => _url;
  BetterPlayerController get betterPlayerController => _betterPlayerController;
  int get audioStreamIndex => _audioStreamIndex;
  int get subtitleStreamIndex => _subtitleStreamIndex;

  factory StreamModel() {
    return _streamProvider;
  }

  StreamModel._internal();

  void setItem(Item item) {
    _item = item;
  }

  void setPlaybackInfos(PlayBackInfos playBackInfos) {
    _playBackInfos = playBackInfos;
  }

  void setURL(String url) {
    _url = url;
  }

  void setBetterPlayerController(
      BetterPlayerController betterPlayerController) {
    _betterPlayerController = betterPlayerController;
  }

  void setAudioStreamIndex(int audioStreamIndex) {
    _audioStreamIndex = audioStreamIndex;
  }

  void setSubtitleStreamIndex(int subtitleStreamIndex) {
    _subtitleStreamIndex = subtitleStreamIndex;
  }

  void startProgressTimer() {
    _timer = Timer.periodic(
        Duration(seconds: 15),
        (Timer t) => itemProgress(_item,
            canSeek: true,
            isMuted:
                _betterPlayerController.videoPlayerController.value.volume > 0
                    ? true
                    : false,
            isPaused:
                !_betterPlayerController.videoPlayerController.value.isPlaying,
            positionTicks: _betterPlayerController
                .videoPlayerController.value.position.inMicroseconds,
            volumeLevel: _betterPlayerController
                .videoPlayerController.value.volume
                .round(),
            subtitlesIndex: _betterPlayerController
                .videoPlayerController.value.caption.number));
  }

  void stopProgressTimer() {
    _timer.cancel();
  }
}