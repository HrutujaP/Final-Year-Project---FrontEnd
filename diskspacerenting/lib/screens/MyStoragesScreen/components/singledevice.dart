import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:flutter/material.dart';

class SingleDeive extends StatelessWidget {
  final String img;
  final String storageId;

  const SingleDeive({
    required this.storageId,
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
                      image: AssetImage('assets/images/$img.jpg'),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Storage Name",
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 18
                                : MediaQuery.of(context).size.width * 0.015,
                            fontWeight: FontWeight.w700)),
                    Row(
                      children: [
                        Icon(
                          Icons.tonality_outlined,
                          size:
                              ResponsiveWidget.isSmallScreen(context) ? 20 : 30,
                          color: kContainerMiddleColor,
                        ),
                        const SizedBox(width: 10),
                        Text("Total Space: 32GB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 12
                                        : MediaQuery.of(context).size.width *
                                            0.013,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.data_usage_rounded,
                          color: kContainerEndColor,
                          size:
                              ResponsiveWidget.isSmallScreen(context) ? 20 : 30,
                        ),
                        const SizedBox(width: 10),
                        Text("Used Space: 10GB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 12
                                        : MediaQuery.of(context).size.width *
                                            0.013,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.pending,
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? 20
                                : 30,
                            color: kSecondaryColor),
                        const SizedBox(width: 10),
                        Text("Rem Space: 22GB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 12
                                        : MediaQuery.of(context).size.width *
                                            0.013,
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
