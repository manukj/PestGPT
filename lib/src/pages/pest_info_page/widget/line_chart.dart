import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/tempature/forecast_weather_response.dart';
import 'package:pest_gpt/src/pages/pest_info_page/widget/temp_difference.dart';
import 'package:pest_gpt/src/utils/tempature_util.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RangeChartData {
  RangeChartData(this.xValue, this.lowValue, this.highValue);
  final num xValue;
  final double lowValue;
  final double highValue;
}

class LineChartData {
  LineChartData(this.x, this.y);
  final num x;
  final double? y;
}

class TempatureLineChart extends StatelessWidget {
  final ForecastWeatherResponse weatherForecast;
  final IdealTemperature idealTemperature =
      IdealTemperature(min: "20", max: "30");
  TempatureLineChart({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    final List<RangeChartData> rangeChartData = weatherForecast.list
        .map((forecast) => RangeChartData(
            forecast.dt,
            (double.parse(idealTemperature.min)),
            (double.parse(idealTemperature.max))))
        .toList();

    final List<RangeChartData> forecastedRangeData = weatherForecast.list
        .map(
          (forecast) => RangeChartData(
            forecast.dt,
            TemperatureUtil.kelvinToCelsius(forecast.temperature.min),
            TemperatureUtil.kelvinToCelsius(
              forecast.temperature.max,
            ),
          ),
        )
        .toList();

    final min = rangeChartData
        .map((e) => e.lowValue)
        .reduce((value, element) => value < element ? value : element);
    final max = rangeChartData
        .map((e) => e.highValue)
        .reduce((value, element) => value > element ? value : element);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Temperature"),
        Container(
          height: 240,
          color: Theme.of(context).colorScheme.surface,
          child: Stack(
            children: [
              buildRangeChart(
                forecastedRangeData,
                context,
                min - 10,
                max + 10,
                Colors.red,
              ),
              buildRangeChart(rangeChartData, context, min - 10, max + 10,
                  Theme.of(context).primaryColor.withOpacity(0.2)),
            ],
          ),
        ),
      ],
    );
  }

  SfCartesianChart buildLineChart(List<LineChartData> lineChartData, context,
      double min, double max, List<RangeChartData> rangeChartData) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: const NumericAxis(
        labelFormat: '{value}',
        labelStyle: TextStyle(color: Colors.transparent, fontSize: 12),
        majorGridLines: MajorGridLines(width: 0, color: Colors.transparent),
        minorGridLines: MinorGridLines(width: 0, color: Colors.transparent),
        majorTickLines: MajorTickLines(width: 0, color: Colors.transparent),
        minorTickLines: MinorTickLines(width: 0, color: Colors.transparent),
        axisLine: AxisLine(width: 0, color: Colors.transparent),
      ),
      primaryYAxis: NumericAxis(
        maximum: max.toDouble(),
        minimum: min.toDouble(),
        axisLine: const AxisLine(width: 0, color: Colors.transparent),
        majorGridLines:
            const MajorGridLines(width: 0, color: Colors.transparent),
        minorGridLines:
            const MinorGridLines(width: 0, color: Colors.transparent),
        majorTickLines:
            const MajorTickLines(width: 0, color: Colors.transparent),
        minorTickLines:
            const MinorTickLines(width: 0, color: Colors.transparent),
        labelStyle: const TextStyle(color: Colors.transparent, fontSize: 12),
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          return ChartAxisLabel(
            '00°',
            const TextStyle(
              fontSize: 12,
              color: Colors.transparent,
            ),
          );
        },
      ),
      series: <CartesianSeries>[
        // Renders line chart
        LineSeries<LineChartData, num>(
          color: Colors.red,
          dataSource: lineChartData,
          xValueMapper: (LineChartData data, _) => data.x,
          yValueMapper: (LineChartData data, _) => data.y,
          markerSettings: const MarkerSettings(
            isVisible: true,
            shape: DataMarkerType
                .circle, // You can choose other shapes like diamond, rectangle, etc.
            color: Colors.red,
            borderWidth: 2,
            borderColor: Colors.white,
          ),
        ),
      ],
      trackballBehavior: TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        lineType: TrackballLineType.vertical,
        tooltipSettings: const InteractiveTooltip(enable: true),
        builder: (BuildContext context, TrackballDetails details) {
          final data = rangeChartData[details.pointIndex ?? 0];
          return TemperatureDifference(
            currentTemp: details.point?.y?.toDouble() ?? 0,
            historicalTemp: (data.lowValue + data.highValue) / 2,
          );
        },
      ),
    );
  }

  SfCartesianChart buildRangeChart(
    List<RangeChartData> rangeChartData,
    BuildContext context,
    double min,
    double max,
    Color color,
  ) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        majorGridLines:
            const MajorGridLines(width: 0, color: Colors.transparent),
        minorGridLines:
            const MinorGridLines(width: 0, color: Colors.transparent),
        majorTickLines:
            const MajorTickLines(width: 0, color: Colors.transparent),
        minorTickLines:
            const MinorTickLines(width: 0, color: Colors.transparent),
        axisLine: const AxisLine(width: 0, color: Colors.transparent),
        labelFormat: '{value}', // Default format for label values
        interval:
            86400, // Set an appropriate interval (e.g., one day in seconds)
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          DateTime date =
              DateTime.fromMillisecondsSinceEpoch(details.value.toInt() * 1000);
          String formattedDate = DateFormat('dd').format(date);
          return ChartAxisLabel(
            formattedDate,
            TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          );
        },
      ),
      primaryYAxis: NumericAxis(
        maximum: max.toDouble(),
        minimum: min.toDouble(),
        labelFormat: '{value}', // Default format for label values
        majorGridLines:
            const MajorGridLines(width: 0, color: Colors.transparent),
        minorGridLines:
            const MinorGridLines(width: 0, color: Colors.transparent),
        majorTickLines:
            const MajorTickLines(width: 0, color: Colors.transparent),
        minorTickLines:
            const MinorTickLines(width: 0, color: Colors.transparent),

        axisLabelFormatter: (AxisLabelRenderDetails details) {
          return ChartAxisLabel(
            '${details.value.toStringAsFixed(0)}°',
            TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          );
        },
      ),
      series: <CartesianSeries<RangeChartData, num>>[
        SplineRangeAreaSeries<RangeChartData, num>(
          dataSource: rangeChartData,
          color: color.withOpacity(0.4),
          borderDrawMode: RangeAreaBorderMode.excludeSides,
          borderColor: color,
          borderWidth: 2,
          xValueMapper: (RangeChartData data, _) => data.xValue,
          lowValueMapper: (RangeChartData data, _) => data.lowValue,
          highValueMapper: (RangeChartData data, _) => data.highValue,
        ),
      ],
    );
  }
}
