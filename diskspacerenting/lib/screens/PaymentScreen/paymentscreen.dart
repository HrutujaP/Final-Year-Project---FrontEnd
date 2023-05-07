import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/rent.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
import 'package:diskspacerenting/screens/Components/datepicker.dart';
import 'package:diskspacerenting/screens/PaymentScreen/components/paymentsection.dart';
import 'package:diskspacerenting/screens/PaymentScreen/components/slidetopay.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  Storage storage;
  Account account;

  static const String id = 'paymentscreen';
  PaymentScreen({required this.storage, required this.account, super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Rent rent = Rent();

  @override
  void initState() {
    rent.storageId = widget.storage.id;
    rent.renteeId = widget.account.Id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: kContainerMiddleColor,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kBackgroundStartColor,
                    kBackgroundEndColor,
                  ],
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
                speed: BubbleSpeed.slow, // normal is the default
              ),
            ),
            ResponsiveWidget.isSmallScreen(context)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopBar(color: kContainerStartColor),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DatePicker(
                          range: (args) {
                            setState(() {
                              rent.rentDuration =
                                  '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
                                  ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';

                              print(
                                  '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
                                  ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}');
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: PaymentSection(
                          storage: widget.storage,
                          account: widget.account,
                          rent: rent,
                        ),
                      ),
                      const Spacer(),
                      Center(
                          child: SlideToPay(
                        rent: rent,
                      )),
                      const SizedBox(height: 20),
                    ],
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const TopBar(color: kContainerStartColor),
                        const Spacer(
                          flex: 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16),
                              child: DatePicker(range: (args) {
                                setState(() {
                                  rent.rentDuration =
                                      '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
                                      ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';

                                  print(
                                      '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
                                      ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}');
                                });
                              }),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16),
                              child: PaymentSection(
                                storage: widget.storage,
                                account: widget.account,
                                rent: rent,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Center(
                            child: SlideToPay(
                          rent: rent,
                        )),
                        const SizedBox(width: 20),
                        const Spacer(
                          flex: 1,
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
