import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/data/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      songName: "Dangerous",
      artistName: "Jorge",
      imagePath: "assets/images/dangerous.png",
      audioPath: "music/dangerous.mp3",
    ),
    Song(
      songName: "Just a Man",
      artistName: "Jorge",
      imagePath: "assets/images/justaMan.png",
      audioPath: "music/justaMan.mp3",
    ),
    Song(
      songName: "Ruthlessness",
      artistName: "Jorge",
      imagePath: "assets/images/ruthlessness.png",
      audioPath: "music/Ruthlessness.mp3",
    ),
    Song(
      songName: "600 Strike",
      artistName: "Jorge",
      imagePath: "assets/images/strike.png",
      audioPath: "music/strike.mp3",
    ),
  ];

  int? _currentSongIndex;

  // A U D I O  P L A Y E R

  // Audio Player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Constructor
  PlaylistProvider() {
    listenToDuration();
  }

  // Initially not playing
  bool _isPlaying = false;

  // Play song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // Pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Resume song
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
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
      if (_currentSongIndex! < _playlist.length - 1) {
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
        currentSongIndex = _playlist.length - 1;
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

  List<Song> get playlist => _playlist;
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
