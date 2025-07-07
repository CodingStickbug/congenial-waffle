import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:music/data/database/boxes.dart';

part 'song.g.dart';

@HiveType(typeId: 1)
class Song extends ChangeNotifier {
  Song({required this.songTitle, required this.audio, required this.imagePath, required this.artist});
  @HiveField(0)
  String songTitle;

  @HiveField(1)
  String artist;

  @HiveField(2)
  String imagePath;

  @HiveField(3)
  String audio;

  int? _currentSongIndex;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Constructor
  //PlaylistProvider() {
    //listenToDuration();
  //}

  // Initially not playing
  bool _isPlaying = false;

  void play() async {
    _isPlaying = true;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(audio));
    notifyListeners();
  }
  void pause() async {
    _isPlaying = false;
    await _audioPlayer.pause();
    notifyListeners();
  }

  // Resume song
  void resume() async {
    _isPlaying = true;
    await _audioPlayer.resume();
    notifyListeners();
  }

  // Pause or Resume Song
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  // Seek to specific location in song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < boxSongs.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  // Play previous song
  void playPreviousSong() {
    if (_currentDuration.inSeconds > 5) {
      play();
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = boxSongs.length - 1;
      }
    }
  }

  // Listen to duration
  void listenToDuration() {
    // Listen for total Duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
    });
    // Listen for current duration
    _audioPlayer.onPositionChanged.listen((newDuration) {
      _currentDuration = newDuration;
    });
    // Listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // DISPOSE of the AUDIO

  // G E T T E R S
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // S E T T E R S

  set currentSongIndex(int? newindex) {
    _currentSongIndex = newindex;

    if (newindex != null) {
      play();
    }
    notifyListeners();
  }
}
