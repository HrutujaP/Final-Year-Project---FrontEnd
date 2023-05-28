import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:diskspacerenting/Functions/functions.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/FileStorage/components/storedfile.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class IndividualFiles extends StatefulWidget {
  Storage storage;
  IndividualFiles({
    required this.storage,
    super.key,
  });

  @override
  State<IndividualFiles> createState() => _IndividualFilesState();
}

class _IndividualFilesState extends State<IndividualFiles> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.41
            : MediaQuery.of(context).size.height * 0.7,
        width: ResponsiveWidget.isSmallScreen(context)
            ? null
            : MediaQuery.of(context).size.width * 0.65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Items",
                    style: TextStyle(
                      foreground: Paint()..shader = linearGradient1,
                      fontSize: ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width * 0.08
                          : MediaQuery.of(context).size.width * 0.017,
                      decoration: TextDecoration.none,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: kContainerEndColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        try {
//                           List<PlatformFile>? files = await FilePicker.platform.pickFiles(
//   allowMultiple: true,
// );
                          List<PlatformFile> files = [];
                          await FilePicker.platform
                              .pickFiles(allowMultiple: true)
                              .then((value) {
                            setState(() {
                              files = value!.files;
                            });
                          });

                          Functions functions = Functions();
                          functions.uploadFiles(widget.storage.id, files);
                          SnackBar snackBar = const SnackBar(
                            content: Text("File Uploaded"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: kBackgroundEndColor,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.height * 0.325
                    : MediaQuery.of(context).size.height * 0.6,
                width: ResponsiveWidget.isSmallScreen(context)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width * 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2),
                        // kContainerEndColor.withOpacity(0.2),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kBackgroundEndColor,
                      width: 1,
                    ),
                  ),
                  // color: kPrimaryColor2.withOpacity(0.8),
                  child: FutureBuilder(
                    future: Functions().getStorageDetails(widget.storage.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<String> fileNames = snapshot.data?.files ?? [];
                        List<String> exts = snapshot.data?.fileExts ?? [];
                        print(snapshot.data?.files);

                        return GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: fileNames.length,
                          physics: const BouncingScrollPhysics(),
                          primary: false,
                          padding: const EdgeInsets.all(8),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (2.2 / 2.0002),
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount:
                                ResponsiveWidget.isSmallScreen(context)
                                    ? 2
                                    : ResponsiveWidget.isMediumScreen(context)
                                        ? 3
                                        : 4,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: StoredFile(
                                name: fileNames[index],
                                id: widget.storage.id,
                                ext: exts[index],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                            color: kContainerMiddleColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
