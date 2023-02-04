import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/PaymentScreen/paymentscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceRentBar extends StatelessWidget {
  const PriceRentBar({
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
              Text('DSR 18.6',
                  style: GoogleFonts.poppins(
                      color: kContainerMiddleColor,
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                      fontWeight: FontWeight.w600)),
              Text('Month',
                  style: GoogleFonts.poppins(
                      color: kContainerMiddleColor,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PaymentScreen.id);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
                              color: kTextColor,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              fontWeight: FontWeight.w700)),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
