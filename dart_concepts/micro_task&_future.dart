import 'dart:async';

void main() async {
  // Define a regular expression to match content inside <p> tags
  print("before");

  Future(() {
    print('in future');
    loopMillionTimes('from future').then((_) {
      print("returned from future");
    });
  });

  print("after");
  scheduleMicrotask(() {
    print('in microtask');
    print('micro task');
    loopMillionTimes('from microtask').then((_) {
      print("returned from microtasl");
    });
  });

  loopMillionTimes('from main').then((_) {
    print("returned from main");
  });
}

Future<void> loopMillionTimes(String where) async {
  print(where);
  for (int i = 0; i < 10000000000; i++) {}
  print("finished");
}
