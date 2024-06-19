import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:videoplayer_app/modal/music_list.dart';

class MusicProvider extends ChangeNotifier {
  List songList = [];

  int index = 0;
  int _currentIndex = 0;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  bool isplay=false;
  void songplay(){
    isplay=!isplay;
    notifyListeners();
  }
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  get seconds => null;
  int get currentIndex => _currentIndex;
  void changeIndex(int index)
  {
    _currentIndex = index;
  }
  double _sliderValue = 0.0;
  double _maxDuration = 0.0;
  double get sliderValue => _sliderValue;
  double get maxDuration => _maxDuration;

  void Music() {

    if (songList.isNotEmpty && index >= 0 && index < songList.length) {
      assetsAudioPlayer.open(
        Audio(songList[_currentIndex]['song']),
        autoStart: true,
        showNotification: true,
      );
      getTotalDuration();
      notifyListeners();
    }
  }
  void updateCurrentDuration() {
    assetsAudioPlayer.currentPosition.listen((position) {
      currentPosition = position;
      notifyListeners();
    });
  }
  void songAdd(List list, int index) {
    songList.clear();
    songList.addAll(list);
    this.index = index;
    log(songList.length.toString());
    Music();
    int currentIndex = 0;
    notifyListeners();
  }


    void seek(double value) {
      assetsAudioPlayer.seek(Duration(milliseconds: value.toInt()));
    notifyListeners();
  }

  void playPreviousSong(){
    if(currentIndex > 0){
      _currentIndex--;
      assetsAudioPlayer?.playlistPlayAtIndex(currentIndex);
      notifyListeners();
    }
  }


  void nextAudio() {
    if (_currentIndex < Hit_Song_list.length - 1) {
      _currentIndex++;
      notifyListeners();
    } else {
      _currentIndex = 0;
      notifyListeners();
    }
    Music();
  }

  void openAudio() async {
    await
    assetsAudioPlayer!.currentPosition.listen((Duration position) {
      if (maxDuration != 0.0) {
        _sliderValue = position.inSeconds.toDouble();
        notifyListeners();
      }
    });

    assetsAudioPlayer!.current.listen((Playing? playing) {
      if (playing != null) {
        final duration = playing.audio.duration;
        _maxDuration = duration.inSeconds.toDouble();
        notifyListeners();
      }
    });
  }
  void getTotalDuration() {
    assetsAudioPlayer.current.listen((playingAudio) {
      if (playingAudio != null) {
        totalDuration = playingAudio.audio.duration;
      }
    });

    notifyListeners();
  }


MusicProvider()
{
  updateCurrentDuration();
}


}
