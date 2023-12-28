abstract interface class State {
  int count;
  State(this.count);
  void operate();

  @override
  String toString() {
    return 'Counter  $count';
  }
}

class CounterContext {
  State _state;

  CounterContext(State initialState) : _state = initialState {
    print(_state);
  }

  void setState(State state) {
    _state = state;
    print(_state);
  }

  State getState() {
    print('$_state');
    return _state;
  }
}

class Initial extends State {
  Initial(super.count) {
    print('Initial State');
    operate();
  }

  @override
  void operate() {
    count = count;
  }
}

class Increment extends State {
  Increment(int count) : super(count) {
    print('Increment State');
    operate();
  }
  @override
  void operate() {
    count++;
  }
}

class Decrement extends State {
  Decrement(super.count) {
    print('Decrement State');
    operate();
  }

  @override
  void operate() {
    count--;
  }
}

void main() {
  CounterContext context = CounterContext(Initial(0));
  context.setState(Increment(context._state.count));
  context.setState(Increment(context._state.count));
  context.setState(Increment(context._state.count));
  context.setState(Decrement(context._state.count));
}
