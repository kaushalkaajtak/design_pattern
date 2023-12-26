abstract class CustomIterator<T> {
  bool hasNext();
  T? next();
}

abstract class Aggregator<T> {
  CustomIterator<T> getIterator();
}

class StringIterator implements CustomIterator<String> {
  final List<String> items;
  int pos = 0;

  StringIterator({required this.items});
  @override
  bool hasNext() {
    if (pos == items.length) {
      return false;
    }
    return true;
  }

  @override
  String? next() {
    if (pos < items.length) {
      var item = items[pos];
      pos++;
      return item;
    }
    return null;
  }
}

class IntIterator implements CustomIterator<int> {
  int pos = 0;
  final List<int> items;

  IntIterator({required this.items});
  @override
  bool hasNext() {
    if (pos == items.length) {
      return false;
    }
    return true;
  }

  @override
  int? next() {
    if (pos < items.length) {
      var item = items[pos];

      pos++;
      return item;
    }
    return null;
  }
}

class StringAggregator implements Aggregator<String> {
  List<String> items = [];

  @override
  CustomIterator<String> getIterator() {
    return StringIterator(items: items);
  }

  void addItem(String item) {
    items.add(item);
  }
}

class IntAggregator implements Aggregator<int> {
  List<int> items = [];
  @override
  CustomIterator<int> getIterator() {
    return IntIterator(items: items);
  }

  void addItem(int item) {
    items.add(item);
  }
}

void main() {
  var aggregator = StringAggregator();

  aggregator.addItem('1');
  aggregator.addItem('2');
  aggregator.addItem('3');
  var iterator = aggregator.getIterator();

  while (iterator.hasNext()) {
    print(iterator.next());
  }

  var aggregator2 = IntAggregator();

  aggregator2.addItem(1);
  aggregator2.addItem(2);
  aggregator2.addItem(3);
  var iterator2 = aggregator.getIterator();

  while (iterator2.hasNext()) {
    print(iterator2.next());
  }
}
