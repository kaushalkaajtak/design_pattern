// Visitor interface
abstract class ChartVisitor {
  void visitDataPoint(DataPoint point);
  void visitSeries(Series series);
  void visitChart(Chart chart);
}

// base element which accepts a visitor
abstract interface class Element {
  void accept(ChartVisitor visitor);
}

// Concrete visitor for generating a bar chart
class BarChartVisitor implements ChartVisitor {
  final List<List<String>> data = [];

  @override
  void visitDataPoint(DataPoint point) {
    print('Visited data point');
  }

  @override
  void visitSeries(Series series) {
    print('Visited series');
  }

  @override
  void visitChart(Chart chart) {
    print('Visited chart');
  }
}

class LineGraphVisitor implements ChartVisitor {
  List<List<double>> data = [];
  @override
  void visitChart(Chart chart) {
    print('Visited chart');
  }

  @override
  void visitDataPoint(DataPoint point) {
    print('Visited data point');
  }

  @override
  void visitSeries(Series series) {
    print('Visited series');
  }
}

// Element classes
class DataPoint implements Element {
  final dynamic x, y;

  DataPoint(this.x, this.y);

  @override
  void accept(ChartVisitor visitor) {
    print('accepted $visitor');
    visitor.visitDataPoint(this);
  }
}

class Series implements Element {
  final String name;
  final List<DataPoint> points;

  Series(this.name, this.points);

  @override
  void accept(ChartVisitor visitor) {
    print('accepted $visitor');
    visitor.visitSeries(this);
  }
}

class Chart implements Element {
  final String title;
  final List<Series> seriesList;

  Chart(this.title, this.seriesList);

  @override
  void accept(ChartVisitor visitor) {
    print('accepted $visitor');
    visitor.visitChart(this);
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
