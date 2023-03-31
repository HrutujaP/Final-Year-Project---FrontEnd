import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StorageRadialGraph extends StatelessWidget {
  const StorageRadialGraph({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      const Text('32GB',
          style: TextStyle(
              color: kContainerStartColor,
              fontSize: 26,
              fontWeight: FontWeight.bold)),
      SizedBox(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.34
            : MediaQuery.of(context).size.width * 0.4,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width * 0.3,
        child: SfCircularChart(
            legend: Legend(
              textStyle:
                  const TextStyle(color: kContainerEndColor, fontSize: 15),
              iconHeight: 15,
              iconWidth: 15,
              isVisible: true,
              offset: const Offset(0, 50),
              position: LegendPosition.bottom,
            ),
            series: <RadialBarSeries<ChartData, String>>[
              RadialBarSeries<ChartData, String>(
                useSeriesColor: true,
                trackOpacity: 0.3,
                cornerStyle: CornerStyle.bothCurve,
                dataSource: chartData,
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(color: Colors.white, fontSize: 15)),
                pointRadiusMapper: (ChartData data, _) => data.text,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData sales, _) => sales.x,
                yValueMapper: (ChartData sales, _) => sales.y,
              )
            ]),
      ),
    ]);
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text, this.color);

  final String x;
  final int y;
  final Color color;
  final String text;
}
