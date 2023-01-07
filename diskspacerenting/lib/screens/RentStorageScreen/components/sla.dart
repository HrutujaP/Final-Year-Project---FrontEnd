import 'package:diskspacerenting/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SLA extends StatelessWidget {
  const SLA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Service Level Agreement',
            style: GoogleFonts.poppins(
                color: kColor1,
                fontSize: MediaQuery.of(context)
                        .size
                        .height *
                    0.02,
                fontWeight: FontWeight.w600)),
        SizedBox(
          width: MediaQuery.of(context).size.width *
              0.03,
        ),
        const Icon(
          Icons.circle,
          color: Colors.amber,
        )
      ],
    );
  }
}
