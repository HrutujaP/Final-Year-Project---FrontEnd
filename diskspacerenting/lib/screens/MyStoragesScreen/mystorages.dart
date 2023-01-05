import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyStorages extends StatefulWidget {
  static const String id = 'mystorages';

  const MyStorages({super.key});

  @override
  State<MyStorages> createState() => _MyStoragesState();
}

class _MyStoragesState extends State<MyStorages> {
  List<ChartData> chartData = [
    ChartData('Rem', 22, '100%', kRedColor),
    ChartData('Used', 10, '100%', kSecondaryColor3),
    ChartData('Total', 32, '100%', kSecondaryColor2),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: kPrimaryColor2,
            gradient: LinearGradient(
              colors: [
                kPrimaryColor1,
                kPrimaryColor,
                kPrimaryColor1,
                kPrimaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(color: kPurpleColor,),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    const Text('My Storages',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                StorageRadialGraph(chartData: chartData),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      var img = index % 4;

                      return SingleDeive(
                        img: img.toString(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.34,
        child: SfCircularChart(
            legend: Legend(
              textStyle: const TextStyle(color: Colors.white, fontSize: 15),
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

class SingleDeive extends StatelessWidget {
  final String img;

  const SingleDeive({
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, FileStoarage.id);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: kPurpleColor.withOpacity(0.7)),
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor2.withOpacity(0.2),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/$img.jpg'),
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.33,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Storage Name",
                        style: TextStyle(
                            color: Colors.amber.shade900,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                    Row(
                      children: const [
                        Icon(
                          Icons.tonality_outlined,
                          size: 20,
                          color: kSecondaryColor2,
                        ),
                        SizedBox(width: 10),
                        Text("Total Space: 32GB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.data_usage_rounded,
                          color: kSecondaryColor3,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text("Used Space: 10GB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.pending,
                          size: 20,
                          color: kRedColor,
                        ),
                        SizedBox(width: 10),
                        Text("Rem Space: 22GB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.text, this.color);

  final String x;
  final int y;
  final Color color;
  final String text;
}
