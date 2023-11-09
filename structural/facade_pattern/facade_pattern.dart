// Subsystem classes
class VideoPlayer {
  void playVideo() {
    print('Playing video...');
  }
}

class AudioSystem {
  void playAudio() {
    print('Playing audio...');
  }
}

class SubtitleSystem {
  void addSubtitles() {
    print('Adding subtitles...');
  }
}

// facade interface
abstract class MovieFacade {
  void playMovie();
}

// client code
void clientPlay(MovieFacade facade) {
  facade.playMovie();
}

void main() {
  clientPlay(NewMovieFacade());
}

// Facade class
class NewMovieFacade extends MovieFacade {
  late VideoPlayer _videoPlayer;
  late AudioSystem _audioSystem;
  late SubtitleSystem _subtitleSystem;

  NewMovieFacade() {
    // initialize subsystems
    // can use abstract factory here.
    _videoPlayer = VideoPlayer();
    _audioSystem = AudioSystem();
    _subtitleSystem = SubtitleSystem();
  }

  @override
  void playMovie() {
    print('Initializing movie...');
    _videoPlayer.playVideo();
    _audioSystem.playAudio();
    _subtitleSystem.addSubtitles();
    print('Movie started!');
  }
}
