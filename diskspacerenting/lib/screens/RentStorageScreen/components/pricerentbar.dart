import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/PaymentScreen/paymentscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceRentBar extends StatelessWidget {
  Account account;
  Storage storage;
  PriceRentBar({
    required this.account,
    required this.storage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${storage.price} DSR/-",
                  style: GoogleFonts.poppins(
                      color: kBackgroundEndColor,
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                      fontWeight: FontWeight.w600)),
              Text('Month',
                  style: GoogleFonts.poppins(
                      color: kBackgroundEndColor,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                            storage: storage,
                            account: account,
                          )));
            },
            child: SizedBox(
              width: ResponsiveWidget.isSmallScreen(context)
                  ? MediaQuery.of(context).size.width * 0.5
                  : MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  elevation: 30,
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.5,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: kContainerEndColor,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      child: Center(
                        child: Text('Rent Now',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: kBackgroundEndColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022,
                                fontWeight: FontWeight.w700)),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
