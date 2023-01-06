import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/HomeScreen/components/topbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RentStorageScreen extends StatelessWidget {
  static const String id = 'rentstoragescreen';

  const RentStorageScreen({super.key});

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
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Column(
              children: [
                const TopBar(color: kItemColor2),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005),
                      Expanded(
                        flex: 50,
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Text(
                            'Storage Name',
                            style: GoogleFonts.acme(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: kSecondaryColor3,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Expanded(
                          flex: 10,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              border: Border.all(
                                  color: kItemColor.withOpacity(0.5), width: 5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.document_scanner_outlined,
                              color: kSecondaryColor2,
                              size: MediaQuery.of(context).size.height * 0.04,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        // right: 30,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  kItemColor,
                                  kItemColor2,
                                  kSecondaryColor2,
                                  kSecondaryColor3
                                ],
                                end: Alignment.topLeft,
                                begin: Alignment.bottomRight,
                              ),
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.275,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  kItemColor,
                                  kItemColor2,
                                  kSecondaryColor2,
                                  kSecondaryColor3
                                ],
                                end: Alignment.topLeft,
                                begin: Alignment.bottomRight,
                              ),
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -15,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.88,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  kItemColor,
                                  kItemColor2,
                                  kSecondaryColor2,
                                  kSecondaryColor3
                                ],
                                end: Alignment.topLeft,
                                begin: Alignment.bottomRight,
                              ),
                              // color: Colors.grey.withOpacity(0.8), 
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
