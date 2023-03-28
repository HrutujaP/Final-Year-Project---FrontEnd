// ignore_for_file: camel_case_types, file_names

import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/Components/datepicker.dart';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class postAdvertisment extends StatefulWidget {
  static const String id = 'postAdvertismentscreen';
  const postAdvertisment({super.key});

  @override
  State<postAdvertisment> createState() => _postAdvertismentState();
}

class _postAdvertismentState extends State<postAdvertisment> {
  bool isStep1Selected = false;
  bool isStep2Selected = false;
  bool isStep3Selected = false;
  bool isStep4Selected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        body: Container(
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    elevation: 20,
                    shadowColor: kContainerStartColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        // height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              // Color(0xffFFD4E2), Color(0xffFF8FB3)
                              kContainerStartColor.withOpacity(0.6),
                              kContainerMiddleColor.withOpacity(0.7),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Step 1: ",
                                    style: TextStyle(
                                      color: kBackgroundEndColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                    ),
                                  ),
                                  Text(
                                    "Select Disks To Rent",
                                    style: TextStyle(
                                      color: kBackgroundEndColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isStep1Selected = !isStep1Selected;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: kBackgroundEndColor,
                                    ),
                                  ),
                                ],
                              ),
                              isStep1Selected
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 140,
                                        child: GridView.builder(
                                          itemCount: 4,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: (8.2 / 2.0002),
                                            crossAxisSpacing: 1,
                                            mainAxisSpacing: 1,
                                            crossAxisCount: 2,
                                          ),
                                          itemBuilder: (context, index) {
                                            return const selectDisks(
                                                diskName: "A",
                                                isSelected: true);
                                          },
                                        ),
                                      ),
                                    )
                                  : const Center(),
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    elevation: 20,
                    shadowColor: kContainerStartColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            // Color(0xffFFD4E2), Color(0xffFF8FB3)
                            kContainerStartColor.withOpacity(0.6),
                            kContainerMiddleColor.withOpacity(0.7),
                            kContainerEndColor.withOpacity(0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: kBackgroundEndColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Step 2: ",
                                  style: TextStyle(
                                    color: kBackgroundEndColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                  ),
                                ),
                                Text(
                                  "Set Details",
                                  style: TextStyle(
                                    color: kBackgroundEndColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isStep2Selected = !isStep2Selected;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: kBackgroundEndColor,
                                  ),
                                ),
                              ],
                            ),
                            isStep2Selected
                                ? SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        children: const [
                                          setAvailableSpace(diskName: "A"),
                                          setAvailableSpace(diskName: "B"),
                                          setAvailableSpace(diskName: "C"),
                                          setAvailableSpace(diskName: "D"),
                                          setAvailableSpace(diskName: "E"),
                                          setAvailableSpace(diskName: "F"),
                                        ],
                                      ),
                                    ),
                                  )
                                : const Center()
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
                    shadowColor: kContainerStartColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            kContainerStartColor.withOpacity(0.6),
                            kContainerMiddleColor.withOpacity(0.7),
                            kContainerEndColor.withOpacity(0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: kBackgroundEndColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Step 3: ",
                                  style: TextStyle(
                                    color: kBackgroundEndColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Set Days To Rent",
                                  style: TextStyle(
                                    color: kBackgroundEndColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isStep3Selected = !isStep3Selected;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: kBackgroundEndColor,
                                  ),
                                ),
                              ],
                            ),
                            isStep3Selected
                                ? const DatePicker()
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
                    shadowColor: kContainerStartColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            // Color(0xffFFD4E2), Color(0xffFF8FB3)
                            kContainerStartColor.withOpacity(0.6),
                            kContainerMiddleColor.withOpacity(0.7),
                            kContainerEndColor.withOpacity(0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: kBackgroundEndColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Step 4 : ",
                                  style: TextStyle(
                                    color: kBackgroundEndColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Set Time",
                                  style: TextStyle(
                                    color: kBackgroundEndColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isStep4Selected = !isStep4Selected;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: kBackgroundEndColor,
                                  ),
                                ),
                              ],
                            ),
                            isStep4Selected
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "From",
                                            style: TextStyle(
                                              color: kTextLightColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            child: TimePickerDialog(
                                              cancelText: "",
                                              confirmText: "",
                                              initialEntryMode:
                                                  TimePickerEntryMode.inputOnly,
                                              initialTime:
                                                  TimeOfDay.fromDateTime(
                                                      DateTime.now()),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "TO",
                                            style: TextStyle(
                                              color: kTextLightColor,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            child: TimePickerDialog(
                                              cancelText: "",
                                              confirmText: "",
                                              initialEntryMode:
                                                  TimePickerEntryMode.inputOnly,
                                              initialTime:
                                                  TimeOfDay.fromDateTime(
                                                      DateTime.now()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : const Center()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kContainerEndColor,
                    onPrimary: kContainerStartColor,
                    shadowColor: kContainerStartColor,
                  ),
                  onPressed: () {},
                  icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.post_add,
                      color: kBackgroundEndColor,
                    ),
                  ),
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Text(
                      "Post",
                      style: TextStyle(
                        color: kBackgroundEndColor,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<TimeOfDay?> showTimePicker({
  required BuildContext context,
  // required TimeOfDay initialTime,
  TransitionBuilder? builder,
  bool useRootNavigator = true,
  TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
  String? cancelText,
  String? confirmText,
  String? helpText,
  String? errorInvalidText,
  String? hourLabelText,
  String? minuteLabelText,
  RouteSettings? routeSettings,
  EntryModeChangeCallback? onEntryModeChanged,
  Offset? anchorPoint,
}) async {
  assert(context != null);
  // assert(initialTime != null);
  assert(useRootNavigator != null);
  assert(initialEntryMode != null);
  assert(debugCheckHasMaterialLocalizations(context));

  final Widget dialog = TimePickerDialog(
    initialTime: TimeOfDay.now(),
    initialEntryMode: initialEntryMode,
    cancelText: cancelText,
    confirmText: confirmText,
    helpText: helpText,
    errorInvalidText: errorInvalidText,
    hourLabelText: hourLabelText,
    minuteLabelText: minuteLabelText,
    onEntryModeChanged: onEntryModeChanged,
  );
  return showDialog<TimeOfDay>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );
}

class selectDisks extends StatefulWidget {
  final String diskName;
  final bool isSelected;
  const selectDisks(
      {super.key, required this.diskName, required this.isSelected});

  @override
  State<selectDisks> createState() => _selectDisksState();
}

class _selectDisksState extends State<selectDisks> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (value) {
            setState(() {
              value = !widget.isSelected;
            });
          },
          value: widget.isSelected,
        ),
        Text(
          widget.diskName,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.06,
            color: kTextLightColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class setAvailableSpace extends StatefulWidget {
  final String diskName;

  const setAvailableSpace({super.key, required this.diskName});

  @override
  State<setAvailableSpace> createState() => _setAvailableSpaceState();
}

class _setAvailableSpaceState extends State<setAvailableSpace> {
  int _currentValue = 1;
  int _priceAmount = 100;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            widget.diskName,
            style: TextStyle(
              color: kTextLightColor,
              fontSize: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 60,
            height: 60,
            child: FittedBox(
              fit: BoxFit.contain,
              child: NumberPicker(
                  itemCount: 1,
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: Colors.white,
                  ),
                  selectedTextStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    color: kContainerEndColor,
                  ),
                  textMapper: (numberText) {
                    return numberText + " GB";
                  },
                  itemHeight: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white),
                  ),
                  axis: Axis.horizontal,
                  minValue: 0,
                  maxValue: 256,
                  step: 50,
                  value: _currentValue,
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                    });
                  }),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 60,
            height: 60,
            child: FittedBox(
              fit: BoxFit.contain,
              child: NumberPicker(
                  itemCount: 1,
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: Colors.white,
                  ),
                  selectedTextStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    color: kContainerStartColor,
                  ),
                  textMapper: (numberText) {
                    return "$numberText Rs";
                  },
                  itemHeight: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white),
                  ),
                  axis: Axis.horizontal,
                  minValue: 0,
                  step: 500,
                  maxValue: 10000000,
                  value: _priceAmount,
                  onChanged: (value) {
                    setState(() {
                      _priceAmount = value;
                    });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
