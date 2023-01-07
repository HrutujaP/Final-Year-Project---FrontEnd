import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbar.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = 'paymentscreen';
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _range = '';
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    });
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(color: kItemColor2),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Column(
                  children: [
                    Row(
                      children: const [
                        Spacer(),
                        Text(
                          'Pick rent duration',
                          style: TextStyle(
                            color: kItemColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Stack(alignment: Alignment.center, children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(0.05),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.31,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kColor1.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(0.1),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.31,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kColor1.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kColor1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SfDateRangePicker(
                              selectionColor: kColor3,
                              startRangeSelectionColor: kColor3,
                              endRangeSelectionColor: kColor3,
                              todayHighlightColor: kPrimaryColor1,
                              rangeSelectionColor: kColor3.withOpacity(0.2),
                              enablePastDates: false,
                              confirmText: 'Confirm',
                              cancelText: 'Cancel',
                              backgroundColor: kColor1,
                              onSelectionChanged: _onSelectionChanged,
                              selectionMode: DateRangePickerSelectionMode.range,
                              initialSelectedRange: PickerDateRange(
                                  DateTime.now(),
                                  DateTime.now().add(const Duration(days: 30))),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  'Selected range: $_range',
                  softWrap: true,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff171327),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.04),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.16,
                          // width:,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffb0f7ff),
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height * 0.04),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.wallet,
                                      color: Color(0xff59abb9),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Subscriptions wallet',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.circle_outlined,
                                      color: const Color(0xff171327),
                                      size: 30,
                                    )
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                const Spacer(),
                const Center(child: SlideToPay()),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlideToPay extends StatefulWidget {
  const SlideToPay({
    Key? key,
  }) : super(key: key);

  @override
  State<SlideToPay> createState() => _SlideToPayState();
}

class _SlideToPayState extends State<SlideToPay> {
  double _sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 50,
        width: 300,
        child: SlideAction(
          elevation: 5,
          innerColor: Colors.white,
          outerColor: Colors.deepPurple,
          sliderButtonIcon: const Icon(Icons.arrow_forward_ios_rounded),
          text: "Slide to Pay",
          onSubmit: () {},
        ));
  }
}
