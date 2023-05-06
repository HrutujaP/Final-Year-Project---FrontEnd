import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/rent.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/Components/topbar.dart';
import 'package:diskspacerenting/screens/Components/datepicker.dart';
import 'package:diskspacerenting/screens/PaymentScreen/components/paymentsection.dart';
import 'package:diskspacerenting/screens/PaymentScreen/components/slidetopay.dart';
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
        body: Container(
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
            child: ResponsiveWidget.isSmallScreen(context)
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: PaymentSection(),
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
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16),
                              child: PaymentSection(),
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
                  )),
      ),
    );
  }
}
