import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/Functions/functions.dart';
import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:flutter/material.dart';

class SingleDeive extends StatefulWidget {
  final bool isowned;
  final String img;
  final String storageId;

  const SingleDeive({
    required this.isowned,
    required this.storageId,
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  State<SingleDeive> createState() => _SingleDeiveState();
}

class _SingleDeiveState extends State<SingleDeive> {
  Functions functions = Functions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.15
            : MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: kContainerStartColor.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              kContainerStartColor.withOpacity(0.8),
              kContainerMiddleColor.withOpacity(0.8),
              kContainerEndColor.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder(
            future: functions.getStorageDetails(widget.storageId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String rem = (int.parse(snapshot.data!.size) -
                        int.parse(snapshot.data!.used))
                    .toString();
                return GestureDetector(
                  onTap: () {
                    !widget.isowned
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FileStoarage(
                                      storage: snapshot.data!,
                                    )))
                        : () {
                            SnackBar snackBar = const SnackBar(
                              content:
                                  Text('You can only edit your rented storage'),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          };
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          clipBehavior: Clip.hardEdge,
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                                kContainerStartColor, BlendMode.color),
                            child: Image(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/images/${widget.img}.jpg'),
                              height: ResponsiveWidget.isMediumScreen(context)
                                  ? MediaQuery.of(context).size.height * 0.12
                                  : MediaQuery.of(context).size.height * 0.3,
                              width: ResponsiveWidget.isSmallScreen(context)
                                  ? MediaQuery.of(context).size.width * 0.33
                                  : MediaQuery.of(context).size.width * 0.2,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(snapshot.data!.name,
                                style: TextStyle(
                                    color: kTextColor,
                                    fontSize:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? 18
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.015,
                                    fontWeight: FontWeight.w700)),
                            Row(
                              children: [
                                Icon(
                                  Icons.tonality_outlined,
                                  size: ResponsiveWidget.isSmallScreen(context)
                                      ? 20
                                      : 30,
                                  color: kContainerMiddleColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                    "Total Space: ${int.parse(snapshot.data!.size) / 1024 / 1024 / 1024}GB",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 12
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.013,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.data_usage_rounded,
                                  color: kContainerEndColor,
                                  size: ResponsiveWidget.isSmallScreen(context)
                                      ? 20
                                      : 30,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                    "Used Space: ${(int.parse(snapshot.data!.used) / 1024 / 1024 / 1024).toStringAsFixed(2)}GB",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 12
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.013,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.pending,
                                    size:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? 20
                                            : 30,
                                    color: kSecondaryColor),
                                const SizedBox(width: 10),
                                Text(
                                    "Rem Space: ${(int.parse(rem) / 1024 / 1024 / 1024).toStringAsFixed(2)}GB",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 12
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.013,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: kSecondaryColor,
                  strokeWidth: 8,
                ));
              }
            }),
      ),
    );
  }
}
