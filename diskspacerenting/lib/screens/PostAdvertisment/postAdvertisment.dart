// ignore_for_file: camel_case_types

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Post Advertisment",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Material(
                  elevation: 20,
                  shadowColor: kPurpleColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              // Color(0xffFFD4E2), Color(0xffFF8FB3)
                              kPrimaryColor,
                              kPrimaryColor2
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(
                          color: kSecondaryColor2,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Step 1 : Select Disks To Rent",
                                style: TextStyle(
                                  color: kPrimaryColor3,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 140,
                                child: GridView.builder(
                                  itemCount: 4,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: (8.2 / 2.0002),
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return const selectDisks(
                                        diskName: "A", isSelected: true);
                                  },
                                ),
                              ),
                            ),
                            // : const Center(),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Material(
                  elevation: 20,
                  shadowColor: kPurpleColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            // Color(0xffFFD4E2), Color(0xffFF8FB3)
                            kPrimaryColor,
                            kPrimaryColor2
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: kColor1,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Step 2 : Set Details",
                              style: TextStyle(
                                color: kPrimaryColor3,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
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
                          // : const Center()
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
                  shadowColor: kPurpleColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        // Color(0xffFFD4E2),
                        //  Color(0xffFF8FB3),
                        kPrimaryColor,
                        kPrimaryColor2
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: kColor3,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Step 3: Set Days To Rent",
                              style: TextStyle(
                                color: kPrimaryColor3,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),
                          const DatePicker(),
                          //
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
                  shadowColor: kPurpleColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        // Color(0xffFFD4E2), Color(0xffFF8FB3)
                        kPrimaryColor,
                        kPrimaryColor2
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: kColor3,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Step 4 : Set Time",
                              style: TextStyle(
                                color: kPrimaryColor3,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: kPrimaryColor2,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    child: TimePickerDialog(
                                      cancelText: "",
                                      confirmText: "",
                                      initialEntryMode:
                                          TimePickerEntryMode.inputOnly,
                                      initialTime: TimeOfDay.fromDateTime(
                                          DateTime.now()),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "TO",
                                    style: TextStyle(
                                      color: kPrimaryColor2,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    child: TimePickerDialog(
                                      cancelText: "",
                                      confirmText: "",
                                      initialEntryMode:
                                          TimePickerEntryMode.inputOnly,
                                      initialTime: TimeOfDay.fromDateTime(
                                          DateTime.now()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          // : const Center()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kPrimaryColor2),
                  onPressed: () {},
                  icon: const Icon(Icons.post_add),
                  label: const Text("Post"))
            ],
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
              color: kSecondaryColor3),
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
              color: kSecondaryColor3,
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
                    color: kPrimaryColor,
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
                    color: kPrimaryColor,
                  ),
                  textMapper: (numberText) {
                    return numberText + " Rs";
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
