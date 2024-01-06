// ALternative implementation in which chat visitor just has a single method for all element class.
// Problem with this is we will not know all type of element at compile time.

// But if we use sealed instead of interface at that time
// we are sure of all the type of implementations of element.

// now another problem is that we cant force to 
// implement new elements if we dont use switch case.

// sealed modifer may make sure no client is avle to extend or implement new elements
// but still it can't make sure that use is not using the switch case.

// Visitor interface
abstract class ChartVisitor {
  void visit(Element element);
}

// base element which accepts a visitor
sealed class Element {
  void accept(ChartVisitor visitor);
}

// Concrete visitor for generating a bar chart
class BarChartVisitor implements ChartVisitor {
  final List<List<String>> data = [];

  @override
  void visit(Element element) {
    switch (element) {
      case DataPoint():
      // TODO: Handle this case.
      case Series():
      // TODO: Handle this case.
      case Chart():
      // TODO: Handle this case.
    }
  }
}

class LineGraphVisitor implements ChartVisitor {
  List<List<double>> data = [];

  @override
  void visit(Element element) {
    switch (element) {
      case DataPoint():
      // TODO: Handle this case.
      case Series():
      // TODO: Handle this case.
      case Chart():
      // TODO: Handle this case.
    }
  }
}

// Element classes
class DataPoint implements Element {
  final dynamic x, y;

  DataPoint(this.x, this.y);

  @override
  void accept(ChartVisitor visitor) {
    print('accepted $visitor');
    visitor.visit(this);
  }
}

class Series implements Element {
  final String name;
  final List<DataPoint> points;

  Series(this.name, this.points);

  @override
  void accept(ChartVisitor visitor) {
    print('accepted $visitor');
    visitor.visit(this);
  }
}

class Chart implements Element {
  final String title;
  final List<Series> seriesList;

  Chart(this.title, this.seriesList);

  @override
  void accept(ChartVisitor visitor) {
    print('accepted $visitor');
    visitor.visit(this);
  }
}

// Usage

void main() {
  // initializing differnt visitors
  final barChartVisitor = BarChartVisitor();
  final lineGraphVisitor = LineGraphVisitor();

  // setting up different elements
  final chart = Chart(
    'Sales Data',
    [
      Series('Product A', [
        DataPoint(1, 10),
        DataPoint(2, 15),
        DataPoint(3, 20),
      ]),
      Series('Product B', [
        DataPoint(1, 5),
        DataPoint(2, 8),
        DataPoint(3, 12),
      ]),
    ],
  );
  final series = Series('some ', [DataPoint(0, 1), DataPoint(1, 1)]);

// passing different visitors in different elements.
  chart.accept(barChartVisitor);
  chart.accept(lineGraphVisitor);

  series.accept(barChartVisitor);
  series.accept(lineGraphVisitor);
}
