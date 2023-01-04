import 'package:diskspacerenting/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/app.dart';

class fileStoarage extends StatefulWidget {
  const fileStoarage({super.key});
  static const String id = 'fileStoarage_screen';

  @override
  State<fileStoarage> createState() => _fileStoarageState();
}

class _fileStoarageState extends State<fileStoarage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor1,
          gradient: LinearGradient(
            colors: [
              kPrimaryColor1,
              kPrimaryColor,
              kPrimaryColor1,
              kPrimaryColor,
              // kPrimaryColor1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: kSecondaryColor1,
                      size: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Spacer(),
                    Icon(
                      Icons.notifications_rounded,
                      color: kSecondaryColor1,
                      size: MediaQuery.of(context).size.width * 0.1,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text("Explore the",
                    style: TextStyle(
                      color: kSecondaryColor1,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text("Storage",
                    style: TextStyle(
                        color: kSecondaryColor1,
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Balances",
                      style: TextStyle(
                        color: kSecondaryColor1,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.question_mark_rounded,
                      color: kSecondaryColor1,
                      size: MediaQuery.of(context).size.width * 0.08,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Material(
                  elevation: 10,
                  color: Colors.white.withOpacity(0.1),
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                color: kSecondaryColor3,
                                size: MediaQuery.of(context).size.width * 0.07,
                              ),
                              Text(
                                " Total space rented",
                                style: TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  decoration: TextDecoration.none,
                                  // fontWeight: FontWeight.w200,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "32 GB",
                                style: TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  decoration: TextDecoration.none,
                                  // fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phonelink,
                                color: kRedColor,
                                size: MediaQuery.of(context).size.width * 0.07,
                              ),
                              Text(
                                " Space used",
                                style: TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  decoration: TextDecoration.none,
                                  // fontWeight: FontWeight.w100,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "8 GB",
                                style: TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  decoration: TextDecoration.none,
                                  // fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.computer,
                                color: kSecondaryColor2,
                                size: MediaQuery.of(context).size.width * 0.07,
                              ),
                              Text(
                                " Space Remaining",
                                style: TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  decoration: TextDecoration.none,
                                  // fontWeight: FontWeight.w100,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "16 GB",
                                style: TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  decoration: TextDecoration.none,
                                  // fontWeight: FontWeight.w100,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 25, 0, 0),
                child: Text(
                  "Items",
                  style: TextStyle(
                    color: kSecondaryColor1,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    decoration: TextDecoration.none,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
