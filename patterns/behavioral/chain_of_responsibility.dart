///
/// Implementing a validation logic for a client to reach a ordering system.
///
///

// signature of handler
abstract class BaseHandler {
  void setNext(BaseHandler handler);
  void handleRequest(Map<String, dynamic> data);
}

void main() {
  BaseHandler handlerA = CheckForIPRequest();
  BaseHandler handlerB = AuthenticateUser();
  BaseHandler handlerC = ConnectToService();
  handlerB.setNext(handlerC);
  handlerA.setNext(handlerB);

  handlerA.handleRequest({"user": "Kaushal"});
  handlerA.handleRequest({"user": "Kaushal"});
  handlerA.handleRequest({"user": "Kaushal"});
  handlerA.handleRequest({"user": "Kaushal"});
}

class ConcreteHandler extends BaseHandler {
  BaseHandler? nextHandler;

  @override
  void setNext(BaseHandler handler) {
    this.nextHandler = handler;
  }

  @override
  void handleRequest(Map<String, dynamic> data) {}
}

class CheckForIPRequest extends ConcreteHandler {
  int count = 0;
  @override
  void handleRequest(Map<String, dynamic> data) {
    count++;
    if (count < 3) {
      print('checked for api request | count: $count ');
      if (nextHandler != null) {
        nextHandler?.handleRequest(data);
      } else {
        print('next handler not assigned');
      }
    } else {
      print('API request blocked due to mutiple requests');
    }
    super.handleRequest(data);
  }
}

class AuthenticateUser extends ConcreteHandler {
  @override
  void handleRequest(Map<String, dynamic> data) {
    if (data['user'] != null) {
      // perform auth logic
      print("authenticated user ${data['user']}");

      if (nextHandler != null) {
        nextHandler?.handleRequest(data);
      } else {
        print('next handler not assigned');
      }
    } else {
      print("User not authorized");
    }
    super.handleRequest(data);
  }
}

class ConnectToService extends ConcreteHandler {
  @override
  void handleRequest(Map<String, dynamic> data) {
    print('provided access to data');
    if (nextHandler != null) {
      nextHandler?.handleRequest(data);
    } else {
      print('next handler not assigned');
    }
    super.handleRequest(data);
  }
}
