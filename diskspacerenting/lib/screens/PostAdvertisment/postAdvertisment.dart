// ignore_for_file: camel_case_types, file_names

import 'package:analog_clock/analog_clock.dart';
import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/screens/Components/datepicker.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import '../../Constants/Responsive/responsiveWidget.dart';
import 'package:universal_disk_space/universal_disk_space.dart';

class postAdvertisment extends StatefulWidget {
  static const String id = 'postAdvertismentscreen';
  const postAdvertisment({super.key});

  @override
  State<postAdvertisment> createState() => _postAdvertismentState();
}

class _postAdvertismentState extends State<postAdvertisment> {
  late List<Disk> disks;

  Future<void> readDisks() async {
    final diskSpace = DiskSpace();
    await diskSpace.scan();
    disks = diskSpace.disks;
  }

  // void createFile() async {
  //   final fileSize = 1024; // Change this to your desired file size in bytes
  //   final fileName = 'myFile'; // Change this to your desired file name
  //   final directoryPath = await FilePicker.platform.getDirectoryPath();
  //   final filePath = '$directoryPath/$fileName';
  //   final file = File(filePath);
  //   file.createSync();
  //   file.writeAsBytesSync(List.filled(fileSize, 0));
  // }

  bool isStep3Selected = false;
  bool isStep4Selected = false;

  String selectedDisk = "";
  double selectedMaxSize = 0;
  double selectedSizeToRent = 0;
  String rentRange = "";
  int rentAmt = 0;
  ScrollController scrollController = ScrollController();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  int bytesToGigabytes(int bytes) {
    double gb = bytes / 1024 / 1024 / 1024;
    return gb.toInt();
  }

  late Future readDisksFuture;

  @override
  void initState() {
    readDisksFuture = readDisks();
    super.initState();
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? newStartTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (newStartTime != null) {
      setState(() {
        _startTime = newStartTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? newEndTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (newEndTime != null) {
      setState(() {
        _endTime = newEndTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: kBackgroundEndColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    kContainerStartColor,
                    kContainerMiddleColor,
                    kContainerEndColor,
                  ]),
            ),
          ),
          title: const Text(
            "Post Advertisment",
            style: TextStyle(
              color: kTextDarkColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kBackgroundStartColor,
                    kBackgroundEndColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned.fill(
              // top: 20,
              child: FloatingBubbles.alwaysRepeating(
                noOfBubbles: 20,
                colorsOfBubbles: const [
                  kContainerStartColor,
                  kContainerMiddleColor,
                  // kContainerEndColor,
                ],

                sizeFactor: 0.2,
                // duration: 120, // 120 seconds.
                opacity: 100,
                paintingStyle: PaintingStyle.fill,
                strokeWidth: 8,
                shape: BubbleShape
                    .circle, // circle is the default. No need to explicitly mention if its a circle.
                speed: BubbleSpeed.normal, // normal is the default
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: ResponsiveWidget.isSmallScreen(context)
                            ? MediaQuery.of(context).size.width
                            : MediaQuery.of(context).size.width / 2,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Material(
                                  elevation: 20,
                                  shadowColor: kContainerEndColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  child: Container(
                                      // width: MediaQuery.of(context).size.width * 0.95,
                                      width: ResponsiveWidget.isSmallScreen(
                                              context)
                                          ? MediaQuery.of(context).size.width
                                          : MediaQuery.of(context).size.width /
                                              2,
                                      // height: 200,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            // Color(0xffFFD4E2), Color(0xffFF8FB3)
                                            kContainerStartColor
                                                .withOpacity(0.6),
                                            kContainerMiddleColor
                                                .withOpacity(0.7),
                                            kContainerEndColor.withOpacity(0.7),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        border: Border.all(
                                          color: kBackgroundEndColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Step 1: ",
                                                  style: TextStyle(
                                                    color: kBackgroundEndColor,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                Text(
                                                  "Select Disk To Rent",
                                                  style: TextStyle(
                                                    color: kBackgroundEndColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FutureBuilder(
                                              future: readDisksFuture,
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.done) {
                                                  return SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            7,
                                                    child: Scrollbar(
                                                      controller:
                                                          scrollController,
                                                      thumbVisibility: true,
                                                      scrollbarOrientation:
                                                          ScrollbarOrientation
                                                              .bottom,
                                                      child: ListView.builder(
                                                          controller:
                                                              scrollController,
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              disks.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.19,
                                                                child:
                                                                    RadioListTile(
                                                                  activeColor:
                                                                      kContainerEndColor,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15)),
                                                                  tileColor:
                                                                      kBackgroundEndColor,
                                                                  title: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        disks[index]
                                                                            .mountPath
                                                                            .toString()
                                                                            .replaceAll(":",
                                                                                ""),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.width * 0.02,
                                                                          color:
                                                                              kTextDarkColor,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Total Space: ${bytesToGigabytes(disks[index].totalSize)} GB',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: MediaQuery.of(context).size.width * 0.01,
                                                                              color: kTextLightColor,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'Free Space: ${bytesToGigabytes(disks[index].availableSpace)} GB',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: MediaQuery.of(context).size.width * 0.01,
                                                                              color: kTextLightColor,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  value: disks[
                                                                          index]
                                                                      .mountPath,
                                                                  groupValue:
                                                                      selectedDisk,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      selectedDisk =
                                                                          value
                                                                              .toString();
                                                                      selectedMaxSize =
                                                                          bytesToGigabytes(disks[index].availableSpace)
                                                                              .toDouble();

                                                                      selectedSizeToRent =
                                                                          selectedMaxSize /
                                                                              2;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  );
                                                } else {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Material(
                                  elevation: 20,
                                  shadowColor: kContainerEndColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  child: Container(
                                    width: ResponsiveWidget.isSmallScreen(
                                            context)
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          kContainerStartColor.withOpacity(0.6),
                                          kContainerMiddleColor
                                              .withOpacity(0.7),
                                          kContainerEndColor.withOpacity(0.7),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      border: Border.all(
                                        color: kBackgroundEndColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Step 2: ",
                                                style: TextStyle(
                                                  color: kBackgroundEndColor,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              Text(
                                                "Set Size To Rent",
                                                style: TextStyle(
                                                  color: kBackgroundEndColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Visibility(
                                            visible: selectedDisk.isNotEmpty,
                                            replacement: const Center(
                                              child: Text(
                                                "Select Disk To Rent",
                                                style: TextStyle(
                                                  color: kTextLightColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Size: ${selectedSizeToRent.toStringAsFixed(2)} GB',
                                                  style: const TextStyle(
                                                    color: kBackgroundEndColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SliderTheme(
                                                  data: const SliderThemeData(
                                                    trackHeight: 4,
                                                    thumbShape:
                                                        RoundSliderThumbShape(
                                                            enabledThumbRadius:
                                                                12),
                                                    activeTrackColor:
                                                        Colors.black,
                                                    inactiveTrackColor:
                                                        Colors.grey,
                                                    thumbColor:
                                                        kContainerEndColor,
                                                  ),
                                                  child: Slider(
                                                    min: 0,
                                                    max: selectedMaxSize,
                                                    value: selectedSizeToRent,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedSizeToRent =
                                                            value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      foregroundColor:
                                                          kContainerEndColor,
                                                      backgroundColor:
                                                          kContainerEndColor,
                                                      shadowColor:
                                                          kContainerEndColor,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        isStep3Selected =
                                                            !isStep3Selected;
                                                      });
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(6.0),
                                                      child: Text(
                                                        "Next",
                                                        style: TextStyle(
                                                          color:
                                                              kBackgroundEndColor,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Material(
                                  elevation: 20,
                                  shadowColor: kContainerEndColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: Container(
                                    width: ResponsiveWidget.isSmallScreen(
                                            context)
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          kContainerStartColor.withOpacity(0.6),
                                          kContainerMiddleColor
                                              .withOpacity(0.7),
                                          kContainerEndColor.withOpacity(0.7),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      border: Border.all(
                                        color: kBackgroundEndColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              Text(
                                                "Step 3: ",
                                                style: TextStyle(
                                                  color: kBackgroundEndColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                "Set Days To Rent",
                                                style: TextStyle(
                                                  color: kBackgroundEndColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          isStep3Selected
                                              ? DatePicker(
                                                  range: rentRange,
                                                )
                                              : const Center(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Material(
                                  elevation: 20,
                                  shadowColor: kContainerEndColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: Container(
                                    width: ResponsiveWidget.isSmallScreen(
                                            context)
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          // Color(0xffFFD4E2), Color(0xffFF8FB3)
                                          kContainerStartColor.withOpacity(0.6),
                                          kContainerMiddleColor
                                              .withOpacity(0.7),
                                          kContainerEndColor.withOpacity(0.7),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      border: Border.all(
                                        color: kBackgroundEndColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Step 4 : ",
                                                style: TextStyle(
                                                  color: kBackgroundEndColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                "Set Active Time",
                                                style: TextStyle(
                                                  color: kBackgroundEndColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Visibility(
                                                visible: isStep3Selected,
                                                replacement: const Center(
                                                  child: Text(
                                                    "Select Disk To Rent",
                                                    style: TextStyle(
                                                      color: kTextLightColor,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            _selectStartTime(
                                                                context),
                                                        child: Column(
                                                          children: [
                                                            const Text(
                                                              'Start Time',
                                                              style: TextStyle(
                                                                color:
                                                                    kTextDarkColor,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            Text(
                                                              _startTime.format(
                                                                  context),
                                                              style:
                                                                  const TextStyle(
                                                                color:
                                                                    kBackgroundEndColor,
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            _selectEndTime(
                                                                context),
                                                        child: Column(
                                                          children: [
                                                            const Text(
                                                              'End Time',
                                                              style: TextStyle(
                                                                color:
                                                                    kTextDarkColor,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            Text(
                                                              _endTime.format(
                                                                  context),
                                                              style:
                                                                  const TextStyle(
                                                                color:
                                                                    kBackgroundEndColor,
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Material(
                                  elevation: 20,
                                  shadowColor: kContainerEndColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: Container(
                                    width: ResponsiveWidget.isSmallScreen(
                                            context)
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          // Color(0xffFFD4E2), Color(0xffFF8FB3)
                                          kContainerStartColor.withOpacity(0.6),
                                          kContainerMiddleColor
                                              .withOpacity(0.7),
                                          kContainerEndColor.withOpacity(0.7),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      border: Border.all(
                                        color: kBackgroundEndColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Step 5 : ",
                                              style: TextStyle(
                                                color: kBackgroundEndColor,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Text(
                                              "Enter Price of Disk per Month",
                                              style: TextStyle(
                                                color: kBackgroundEndColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Spacer(),
                                            SizedBox(
                                              width: 100,
                                              child: TextField(
                                                cursorColor:
                                                    kBackgroundEndColor,
                                                maxLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                controller:
                                                    TextEditingController(),
                                                onChanged: (value) {
                                                  rentAmt = value.isEmpty
                                                      ? 0
                                                      : int.parse(value);
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: "Enter Price",
                                                  hintStyle: TextStyle(
                                                    color: kTextLightColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: kContainerStartColor,
                            backgroundColor: kContainerEndColor,
                            shadowColor: kContainerEndColor,
                          ),
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.post_add,
                              color: kBackgroundEndColor,
                            ),
                          ),
                          label: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                            child: Text(
                              "Post",
                              style: TextStyle(
                                color: kBackgroundEndColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ResponsiveWidget.isSmallScreen(context)
                    ? const Center()
                    : Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: SizedBox(
                          child: Center(
                            child: Material(
                              elevation: 20,
                              shadowColor: kContainerEndColor,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(300),
                              child: SizedBox(
                                child: AnalogClock(
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  tickColor: kContainerMiddleColor,
                                  width: ResponsiveWidget.isMediumScreen(
                                          context)
                                      ? MediaQuery.of(context).size.width / 2.5
                                      : MediaQuery.of(context).size.width / 3.5,
                                  height: ResponsiveWidget.isMediumScreen(
                                          context)
                                      ? MediaQuery.of(context).size.width / 2.5
                                      : MediaQuery.of(context).size.width / 3.5,
                                  isLive: true,
                                  hourHandColor: kBackgroundEndColor,
                                  minuteHandColor: kBackgroundEndColor,
                                  secondHandColor: kContainerStartColor,
                                  showSecondHand: true,
                                  numberColor: kBackgroundEndColor,
                                  showNumbers: false,
                                  showAllNumbers: false,
                                  textScaleFactor: 1.4,
                                  showTicks: true,
                                  showDigitalClock: false,
                                  datetime: DateTime.now(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                // : const Center(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
