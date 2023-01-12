import 'package:diskspacerenting/Constants/constants.dart';
import 'package:flutter/material.dart';

class MainOptions extends StatelessWidget {
  final IconData icon;
  final String hText;
  final String pText;
  final Color color;
  final String route;

  const MainOptions({
    required this.icon,
    required this.hText,
    required this.pText,
    required this.color,
    required this.route,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: kPrimaryColor2.withOpacity(0.2),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, route);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        icon,
                        color: color,
                        size: MediaQuery.of(context).size.width * 0.15,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    hText,
                    style: const TextStyle(
                        color: kPrimaryColor6,
                        fontSize: 22,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    pText,
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
