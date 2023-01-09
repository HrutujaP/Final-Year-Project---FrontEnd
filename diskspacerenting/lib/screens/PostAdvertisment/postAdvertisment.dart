// ignore_for_file: camel_case_types

import 'package:diskspacerenting/Constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class postAdvertisment extends StatefulWidget {
  static const String id = 'postAdvertismentscreen';
  const postAdvertisment({super.key});

  @override
  State<postAdvertisment> createState() => _postAdvertismentState();
}

class _postAdvertismentState extends State<postAdvertisment> {
  bool selectAvalilableDisks = false;
  bool setStorageLimits = false;
  bool selected = true;
  bool credit = false;

  @override
  Widget build(BuildContext context) {
    double selectedWidthActive = MediaQuery.of(context).size.width * 0.9;
    double selectedWidthInActive = MediaQuery.of(context).size.width * 0.9;
    double selectedHeightActive = MediaQuery.of(context).size.height * 0.45;
    double selectedHeightInActive = MediaQuery.of(context).size.width * 0.150;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectAvalilableDisks = !selectAvalilableDisks;
                  credit = true;
                });
              },
              child: Container(
                  width: selectAvalilableDisks
                      ? selectedWidthActive
                      : selectedWidthInActive,
                  height: selectAvalilableDisks
                      ? selectedHeightActive
                      : selectedHeightInActive,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffFFD4E2), Color(0xffFF8FB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Row(
                            children: [
                              Text(
                                "Select Disks To Rent",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward,
                              ),
                            ],
                          ),
                        ),
                        selectAvalilableDisks == true
                            ? SizedBox(
                                height: selectedHeightActive / 1.2,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      selectDisks(
                                          diskName: "A", isSelected: true),
                                      selectDisks(
                                          diskName: "B", isSelected: true),
                                      selectDisks(
                                          diskName: "C", isSelected: true),
                                      selectDisks(
                                          diskName: "D", isSelected: true),
                                      selectDisks(
                                          diskName: "E", isSelected: true),
                                    ],
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
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                  credit = true;
                });
              },
              child: Container(
                width: selected ? selectedWidthActive : selectedWidthInActive,
                height:
                    selected ? selectedHeightActive : selectedHeightInActive,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffFFD4E2), Color(0xffFF8FB3)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Row(
                          children: [
                            Text(
                              "Set Storage Limits",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward,
                            ),
                          ],
                        ),
                      ),
                      selected == true
                          ? SizedBox(
                              height: selectedHeightActive / 1.2,
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
        ],
      ),
    );
  }
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
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06),
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            widget.diskName,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: FittedBox(
              fit: BoxFit.contain,
              child: NumberPicker(
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: Colors.white,
                  ),
                  selectedTextStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    color: kPrimaryColor,
                  ),
                  itemHeight: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white),
                  ),
                  axis: Axis.horizontal,
                  minValue: 1,
                  maxValue: 256,
                  value: _currentValue,
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                    });
                  }),
            ),
          ),
          const Text("GB"),
        ],
      ),
    );
  }
}
