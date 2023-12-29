// Visitor interface
abstract class ChartVisitor {
  void visitDataPoint(DataPoint point);
  void visitSeries(Series series);
  void visitChart(Chart chart);
}

// Concrete visitor for generating a bar chart
class BarChartVisitor implements ChartVisitor {
  final List<List<String>> data = [];

  @override
  void visitDataPoint(DataPoint point) {
    data.add([point.x.toString(), point.y.toString()]);
  }

  @override
  void visitSeries(Series series) {
    // Add customization for series (colors, labels)
  }

  @override
  void visitChart(Chart chart) {
    // Generate the bar chart using a library like charts_flutter
    // (specific implementation omitted for brevity)
  }
}

class LineGraphVisitor implements ChartVisitor {
  List<List<double>> data = [];
  @override
  void visitChart(Chart chart) {
    // TODO: implement visitChart
  }

  @override
  void visitDataPoint(DataPoint point) {
    data.add([point.x, point.y]);
  }

  @override
  void visitSeries(Series series) {
    // TODO: implement visitSeries
  }
}

// Element classes
class DataPoint {
  final dynamic x, y;

  DataPoint(this.x, this.y);

  void accept(ChartVisitor visitor) => visitor.visitDataPoint(this);
}

class Series {
  final String name;
  final List<DataPoint> points;

  Series(this.name, this.points);

  void accept(ChartVisitor visitor) => visitor.visitSeries(this);
}

class Chart {
  final String title;
  final List<Series> seriesList;

  Chart(this.title, this.seriesList);

  void accept(ChartVisitor visitor) => visitor.visitChart(this);
}

// Usage

void main() {
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

  final barChartVisitor = BarChartVisitor();
  final lineGraphVisitor = LineGraphVisitor();

  chart.accept(barChartVisitor);
  chart.accept(lineGraphVisitor);
}
