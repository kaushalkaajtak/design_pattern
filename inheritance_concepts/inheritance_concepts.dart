mixin Photo {
  void showSize(String type) {
    print('photo $type');
  }
}
mixin Video {
  void showSize(String typoe) {
    print('video  $typoe');
  }
}

abstract class Audio {
  void showSize(String type) {
    print('audio $type');
  }
}

class Test {
  void showSize(String type) {
    print('test $type');
  }
}

class Media with Video, Photo {}

class AnotherMedia extends Audio implements Photo {}

class YetAnotherMedia extends Audio with Photo {}

class AgainMedia with Photo implements Audio {}

class SuperMedia extends Audio with Photo implements Media {}

class SomeOtherMedia implements Audio, Video, Test {
  @override
  void showSize(String type) {
    print('Overriddedn $type');
  }
}

void client() {
  Media media = Media();
  AnotherMedia anotherMedia = AnotherMedia();
  YetAnotherMedia yetAnotherMedia = YetAnotherMedia();
  AgainMedia againMedia = AgainMedia();
  SomeOtherMedia someOtherMedia = SomeOtherMedia();
  media.showSize('with v,p');
  anotherMedia.showSize('extends a implements p');
  yetAnotherMedia.showSize('extends a with p');
  againMedia.showSize('with p implements a');
  someOtherMedia.showSize('implements a,p');
  SuperMedia().showSize('extends A with P implements M');
}

void main() {
  client();
}
