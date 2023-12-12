enum AudioType { mp4, mp3 }

// Target Interface
abstract class MediaPlayer {
  void play(AudioType audioType, String filename);
  void stop(AudioType audioType, String filename);
}

// client
void playMedia(MediaPlayer player) {
  player.play(AudioType.mp3, 'example.mp3');
  player.play(AudioType.mp4, 'example.mp4');
}

void main() {
  playMedia(MediaPlayerAdapter(advancedAudioPlayer: AdvancedAudioPlayer()));
}

// Adaptee (existing class)
class AdvancedAudioPlayer {
  void playMP4(String filename) {
    print('Playing MP4 file: $filename');
  }

  void playMP3(String filename) {
    print('Playing MP3 file: $filename');
  }

  void stopMP4(String filename) {
    print('Stopping MP4 file: $filename');
  }

  void stopMP3(String filename) {
    print('Stopping MP3 file: $filename');
  }
}

// Adapter class
class MediaPlayerAdapter extends MediaPlayer {
  final AdvancedAudioPlayer advancedAudioPlayer;

  MediaPlayerAdapter({required this.advancedAudioPlayer});
  @override
  void play(AudioType audioType, String filename) {
    switch (audioType) {
      case AudioType.mp4:
        advancedAudioPlayer.playMP4(filename);
        break;

      case AudioType.mp3:
        advancedAudioPlayer.playMP3(filename);
        break;
    }
  }

  @override
  void stop(AudioType audioType, String filename) {
    switch (audioType) {
      case AudioType.mp4:
        advancedAudioPlayer.stopMP4(filename);
        break;

      case AudioType.mp3:
        advancedAudioPlayer.stopMP3(filename);
        break;
    }
  }
}
