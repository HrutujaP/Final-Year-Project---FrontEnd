import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/PostAdvertisment/components/postAdvertisementAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class postAdvertisment extends StatefulWidget {
  static const String id = 'postAdvertismentscreen';
  const postAdvertisment({super.key});

  @override
  State<postAdvertisment> createState() => _postAdvertismentState();
}

bool _isSelected = true;
String? selectedValue = null;
List<String> _selectedDisks = [];
List<DropdownMenuItem<String>> _availableDisks = [
  const DropdownMenuItem(value: "A", child: Text("A")),
  const DropdownMenuItem(value: "B", child: Text("B")),
];

class _postAdvertismentState extends State<postAdvertisment> {
  int _selectedFruit = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/postAdvertisement3.jpeg"),
                Text(
                  "Post Advertisment",
                  style: TextStyle(
                    color: kPrimaryColor,
                    decoration: TextDecoration.none,
                    fontSize: MediaQuery.of(context).size.width * .05,
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height / 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            value: _selectedDisks,
                            child: ListView(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      onChanged: (value) {},
                                      value: _isSelected,
                                    ),
                                    Text('A'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      onChanged: (value) {},
                                      value: false,
                                    ),
                                    Text('B'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                        hint: const Text('Select Disk to rent'),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
