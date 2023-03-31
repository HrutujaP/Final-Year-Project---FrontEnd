import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
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
                color: kContainerStartColor,
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.height * 0.02
                    : MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.w600)),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        const Icon(
          Icons.circle,
          color: Colors.amber,
        )
      ],
    );
  }
}
