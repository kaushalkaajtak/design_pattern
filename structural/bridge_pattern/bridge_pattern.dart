// abstraction
abstract class Renderer {
  final Platform platform;

  Renderer({required this.platform});
  void renderOnScreen();
}

// implementation
abstract class Platform {
  void render(String renderer);
}

// client
class Flutter {
  final Renderer renderer;

  Flutter({required this.renderer});
  void renderUI() {
    renderer.renderOnScreen();
  }
}

void main() {
  Flutter(renderer: SkiaEngine(platform: AndroidPlatform())).renderUI();
  Flutter(renderer: ImplellerEngine(platform: IOSPlatform())).renderUI();
  Flutter(renderer: ImplellerEngine(platform: WindowsPlatform())).renderUI();
}

class AndroidPlatform extends Platform {
  @override
  void render(String renderer) {
    print('rendered on Android using $renderer');
  }
}

class IOSPlatform extends Platform {
  @override
  void render(String renderer) {
    print('rendered on IOS using $renderer');
  }
}

class WindowsPlatform extends Platform {
  @override
  void render(String renderer) {
    print('rendered on Windows using $renderer');
  }
}

class SkiaEngine extends Renderer {
  SkiaEngine({required super.platform});

  @override
  void renderOnScreen() {
    platform.render('Skia');
  }
}

class ImplellerEngine extends Renderer {
  ImplellerEngine({required super.platform});

  @override
  void renderOnScreen() {
    platform.render('Impeller');
  }
}
