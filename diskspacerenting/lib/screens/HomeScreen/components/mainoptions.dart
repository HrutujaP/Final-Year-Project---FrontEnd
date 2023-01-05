import 'package:flutter/material.dart';

class MainOptions extends StatelessWidget {
  final IconData icon;
  final String hText;
  final String pText;
  final Color color;

  const MainOptions({
    required this.icon,
    required this.hText,
    required this.pText,
    required this.color,
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
        color: Colors.grey[700]?.withOpacity(0.4),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                      color: Colors.white,
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
                      color: Colors.grey.shade300,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}