abstract class Notifier {
  void notify();
}

class NotifierImpl extends Notifier {
  @override
  void notify() {
    print("notify user");
  }
}

class BaseDecorator extends Notifier {
  final Notifier notifier;
  final String decoratorName;

  BaseDecorator({required this.decoratorName, required this.notifier});

  @override
  void notify() {
    print('$decoratorName added');
    notifier.notify();
  }
}

class SlackDecorator extends BaseDecorator {
  SlackDecorator({required super.decoratorName, required super.notifier});

  @override
  void notify() {
    print('adding slack notifier');
    notifier.notify();
  }
}

class SMSDecorator extends BaseDecorator {
  SMSDecorator({required super.decoratorName, required super.notifier});
  @override
  void notify() {
    print('adding sms notifier');
    notifier.notify();
  }
}

void client() {
  var slack = SlackDecorator(decoratorName: 'Slack', notifier: NotifierImpl());
  var sms = SMSDecorator(decoratorName: 'sms', notifier: slack);
  slack.notify();
  sms.notify();
}

void main() {
  client();
}
