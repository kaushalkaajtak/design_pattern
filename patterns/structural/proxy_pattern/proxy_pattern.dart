// This is an example of security proxy.

// subject interface
abstract class MoneyStore {
  void spend();
}

// concrete subject
class Bank extends MoneyStore {
  final String source;

  Bank({required this.source});
  @override
  void spend() {
    print('spend money from bank from $source');
  }
}

// proxy
class CreditCard extends MoneyStore {
  MoneyStore? _store;

  CreditCard() {
    if (_store == null) {
      _store = Bank(source: 'Credit card');
    }
  }
  @override
  void spend() {
    if (authenticateUser()) {
      _store?.spend();
    }
  }

  bool authenticateUser() => true;
}

void main() {
  var wallet = CreditCard();
  wallet.spend();

// example for Cache proxy
  var video = VideoPlayerProxy(file: 'video.mp4');

  video.play();
  video
      .play(); // called play twice but initialization happend once.(desired behavior).

  var op = LoggingOperationProxy();
  op.performTask();
  op.performTask();
}

// example for Cache proxy
abstract class VideoPlayer {
  final String file;

  VideoPlayer({required this.file});
  void play();
}

class RealVideoPlayer extends VideoPlayer {
  RealVideoPlayer({required super.file}) {
    decreptVideoFile(file);
  }

  @override
  void play() {
    print('playing video $file');
  }

  void decreptVideoFile(String file) {
    print('Decrypting file $file');
  }
}

class VideoPlayerProxy extends VideoPlayer {
  RealVideoPlayer? _realVideoPlayer;

  VideoPlayerProxy({required super.file}) {
    if (_realVideoPlayer == null || (_realVideoPlayer?.file ?? '') == file) {
      _realVideoPlayer = RealVideoPlayer(file: file);
    }
  }
  @override
  void play() {
    _realVideoPlayer?.play();
  }
}

abstract class BaseOperation {
  void performTask();
}

class ConcreteOperation extends BaseOperation {
  @override
  void performTask() {
    print('Performing concrete operation');
  }
}

class LoggingOperationProxy extends BaseOperation {
  BaseOperation? operation;

  LoggingOperationProxy() {
    if (operation == null) operation = ConcreteOperation();
  }
  @override
  void performTask() {
    print('logging operations ${DateTime.now()}');
    operation?.performTask();
  }
}
