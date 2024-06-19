#  Ganna App


### 1. Set Up Your Flutter Environment

If you haven't already, set up Flutter on your machine:


### 2. Create a New Flutter Project

Open your terminal or command prompt and run:

```bash
flutter create audio_app
cd audio_app
```

### 3. Add Necessary Dependencies

You will need a package to handle audio playback. One of the most popular packages for this purpose is `just_audio`. Add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  just_audio: ^0.9.18
  provider: ^6.0.2 # For state management
```

Run `flutter pub get` to install the new dependencies.


This simple app provides a basic structure for an audio player. The `AudioProvider` class handles the audio logic using the `just_audio` package, while the UI consists of buttons to control the audio playback.

### 5. Expand Functionality

To build a more comprehensive audio app, you might want to add features like:

- **Audio playlists**: Manage multiple audio tracks.
- **UI enhancements**: Display current track information, add progress bars, etc.
- **State management**: Use `Provider`, `Bloc`, or another state management solution for more complex state handling.
- **Offline support**: Download and play audio files offline.

### Example for Adding a Playlist

You can enhance the `AudioProvider` to manage a playlist:

```dart
class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _playlist = [
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
  ];
  int _currentIndex = 0;

  void play() async {
    try {
      await _audioPlayer.setUrl(_playlist[_currentIndex]);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void next() {
    if (_currentIndex < _playlist.length - 1) {
      _currentIndex++;
      play();
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _currentIndex--;
      play();
    }
  }
}
```





### ScreenShort


<p align='center'>
  <img src='https://github.com/Rajputniraj6983/videoplayer_app/assets/143181391/2d9ce256-c8dd-463c-b970-40bdff2e5de5' width=250>
  <img src='https://github.com/Rajputniraj6983/videoplayer_app/assets/143181391/c101cfe7-2352-4ff1-a357-627f35b776dd' width=250>
  <img src='https://github.com/Rajputniraj6983/videoplayer_app/assets/143181391/d9f25563-bdde-48fd-839f-40fae4417d66' width=250>
  <img src='https://github.com/Rajputniraj6983/videoplayer_app/assets/143181391/c0e25512-72a0-4dc4-a431-7c86377a83ca' width=250>

</p>

### Video







