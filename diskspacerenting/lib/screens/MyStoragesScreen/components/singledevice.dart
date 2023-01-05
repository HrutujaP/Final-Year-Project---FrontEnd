import 'package:diskspacerenting/Constants/constants.dart';
import 'package:diskspacerenting/screens/FileStorage/fileStorage.dart';
import 'package:flutter/material.dart';

class SingleDeive extends StatelessWidget {
  final String img;

  const SingleDeive({
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, FileStoarage.id);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: kPurpleColor.withOpacity(0.7)),
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor2.withOpacity(0.2),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/$img.jpg'),
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.33,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Storage Name",
                        style: TextStyle(
                            color: Colors.amber.shade900,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                    Row(
                      children: const [
                        Icon(
                          Icons.tonality_outlined,
                          size: 20,
                          color: kSecondaryColor2,
                        ),
                        SizedBox(width: 10),
                        Text("Total Space: 32GB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.data_usage_rounded,
                          color: kSecondaryColor3,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text("Used Space: 10GB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.pending,
                          size: 20,
                          color: kRedColor,
                        ),
                        SizedBox(width: 10),
                        Text("Rem Space: 22GB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}