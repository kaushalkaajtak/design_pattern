// component
abstract class SystemFile {
  int showSize();
}

// Leaf
class File extends SystemFile {
  final String fileName;
  final int size;

  File({required this.size, required this.fileName});
  @override
  int showSize() {
    print('$fileName : $size KB');
    return size;
  }
}

// composite class
class Folder extends SystemFile {
  final String name;
  final List<SystemFile> files = [];

  Folder({required this.name});

  void addFile(SystemFile file) {
    files.add(file);
  }

  void removeFile(SystemFile file) {
    files.remove(file);
  }

  @override
  int showSize() {
    if (files.isEmpty) return 0;
    // probably sum up all the values and return or print

    var size = 0;
    files.forEach((file) {
      size += file.showSize();
    });

    print('$name : ${size} KB');

    return size;
  }
}

void client() {
  var musicFolder = Folder(name: 'Music');

  musicFolder.addFile(File(fileName: 'abc.mp3', size: 10));
  musicFolder.addFile(File(fileName: 'def.mp3', size: 20));
  var moviesFolder = Folder(name: 'movies');
  moviesFolder.addFile(File(size: 20, fileName: 'titanic.mp4'));

  var studyMaterial = Folder(name: 'Study material');

  studyMaterial.addFile(musicFolder);
  studyMaterial.addFile(moviesFolder);

  studyMaterial.showSize();
}

void main() {
  client();
}
