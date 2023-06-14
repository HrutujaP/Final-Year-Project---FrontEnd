import 'dart:async';
import 'dart:io';
import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFScreen extends StatefulWidget {
  final String path;

  const PDFScreen({Key? key, required this.path}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  String remotePDFpath = "";

  Future<File> createFileOfPdfUrl(String url) async {
    Completer<File> completer = Completer();
    // print("Start download file from internet!");
    try {
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      // print("Download files");
      // print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  void generateFile(String url) {
    print(url);
    createFileOfPdfUrl(url).then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    generateFile(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 5,
          backgroundColor: kBackgroundEndColor,
          title: Text(
            "Document",
            style: TextStyle(fontSize: MediaQuery.of(context).size.width / 15),
          ),
        ),
        body: remotePDFpath != ''
            ? Stack(
                children: <Widget>[
                  PDFView(
                    filePath: remotePDFpath,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: true,
                    pageSnap: true,
                    defaultPage: currentPage!,
                    fitPolicy: FitPolicy.BOTH,
                    preventLinkNavigation:
                        false, // if set to true the link is handled in flutter
                    onRender: (_pages) {
                      setState(() {
                        pages = _pages;
                        isReady = true;
                      });
                    },
                    onError: (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                      // print(error.toString());
                    },
                    onPageError: (page, error) {
                      setState(() {
                        errorMessage = '$page: ${error.toString()}';
                      });
                      // print('$page: ${error.toString()}');
                    },
                    onViewCreated: (PDFViewController pdfViewController) {
                      _controller.complete(pdfViewController);
                    },
                    onLinkHandler: (String? uri) {
                      // print('goto uri: $uri');
                    },
                    onPageChanged: (int? page, int? total) {
                      // print('page change: $page/$total');
                      setState(() {
                        currentPage = page;
                      });
                    },
                  ),
                  errorMessage.isEmpty
                      ? !isReady
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: kSecondaryColor,
                              ),
                            )
                          : Container()
                      : Center(
                          child: Text(errorMessage),
                        )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: kSecondaryColor,
                ),
              ),
        // body: SfPdfViewer.memory(widget.path),
        floatingActionButton: FutureBuilder<PDFViewController>(
          future: _controller.future,
          builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
            if (snapshot.hasData) {
              return FloatingActionButton.extended(
                backgroundColor: kSecondaryColor,
                label: Text("Go to ${pages! ~/ 2}"),
                onPressed: () async {
                  await snapshot.data!.setPage(pages! ~/ 2);
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
