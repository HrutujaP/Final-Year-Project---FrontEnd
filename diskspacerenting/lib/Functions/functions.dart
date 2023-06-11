// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:firedart/firedart.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/rent.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/GoogleSignInScreen/googleSignInScreen.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Functions {
  // static const String apiUrl = "http://localhost:8080/api/account";
  static const String apiUrl =
      "http://app-07824057-9a46-44d4-8c9a-6e76e325f03e.cleverapps.io/api/account";
  // static const String apiUrl = "http://10.0.2.2:8080/api/account";  // For emulator

  Future<Account?> readAccountDetails(String id) async {
    Account account = Account();
    String url = "$apiUrl/get_account?account_principal=$id";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    try {
      if (response.statusCode == 200) {
        var result = response.body;

        final Map<String, dynamic> body = jsonDecode(result);
        account.Email = body["Email"];
        account.Name = body["Name"];
        account.Id = body["Id"];
        account.balance = body["Balance"];
        account.ownedStorageIds = body["My_Storages"].cast<String>();
        account.rentedStorageIds = body["Rented_Storages"].cast<String>();

        print("Account details read");
      } else {
        print(response.statusCode);
        print(response.body);
      }
    } catch (e) {
      print(e);
      return null;
    }

    return account;
  }

  Future<Storage> getStorageDetails(String id) async {
    Storage storage = Storage();
    String url = "$apiUrl/get_storage?storage_principal=$id";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var result = response.body;

      final Map<String, dynamic> body = jsonDecode(result);
      storage.id = body["Id"];
      storage.name = body["Name"];
      storage.description = body["Description"];
      storage.timings = body["Timings"];
      storage.fileExts = body["FileExt"].cast<String>();
      storage.files = body["Files"].cast<String>();
      storage.ownerId = body["OwnerPrincipal"];
      storage.price = body["Rent"];
      storage.size = body["Space"];
      storage.loc = body["Path"];
      storage.duration = body["TimePeriod"];
      storage.used = body["UsedSpace"];
      storage.rentDuration =
          body["RenteeDuration"].isEmpty ? "" : body["RenteeDuration"][0];
      storage.renteeId =
          body["RenterPrincipal"].isEmpty ? "" : body["RenterPrincipal"];

      print("Account details read");
    } else {
      print(response.statusCode);
      print(response.body);
    }

    return storage;
  }

  // void createFile(String dir, Storage storage) async {
  //   final fileSize = (int.parse(storage.size) * 1e9)
  //       .toInt(); // Change this to your desired file size in bytes
  //   final fileName = storage.ownerId; // Change this to your desired file name
  //   final directoryPath = dir;
  //   final filePath = '$directoryPath/$fileName';
  //   final file = File(filePath);
  //   file.createSync();
  //   file.writeAsBytesSync(List.filled(fileSize, 0));
  // }

  Future<String> createStorage(Storage strorage) async {
    const String url = "$apiUrl/create_storage";
    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final Map<String, String> body = {
      "rent": strorage.price,
      "owner_principal": strorage.ownerId,
      "storage_size": strorage.size,
      "path": strorage.loc,
      "timeperiod": strorage.duration,
      "name": strorage.name,
      "description": strorage.description,
      "timings": strorage.timings,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);

      // createFile(strorage.loc, strorage);

      return decoded["Id"];
    } else {
      print(response.statusCode);
      print(response.body);
      return "Error";
    }
  }

  void setUser(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Id', id);
    print("Set user id");
  }

  void checkAndCreateAccount(
      String name, String email, BuildContext context) async {
    const String url = "$apiUrl/create_account";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final Map<String, dynamic> body = {
      "email": email,
      "name": name,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      setUser(response.body);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? id = prefs.getString("Id");
      Account? account;
      if (id != null) {
        Functions function = Functions();
        account = await function.readAccountDetails(id);
        if (account == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const registerScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(account: account ?? Account()),
            ),
          );
        }
      }
    } else {
      print(response.body);
    }
  }

  Future<List<Storage>> getStorages(int limit) async {
    int min = limit <= 100
        ? 0
        : limit <= 500
            ? 100
            : limit <= 1000
                ? 500
                : 0;

    List<Storage> storages = [];

    const String url = "$apiUrl/get_available_storages";
    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var result = response.body;

      for (var node in jsonDecode(result)) {
        if (min < int.parse(node["Space"]) / 1024 / 1024 / 1024 &&
            int.parse(node["Space"]) / 1024 / 1024 / 1024 <= limit) {
          Storage storage = Storage();
          storage.id = node["Id"];
          storage.ownerId = node["OwnerPrincipal"];
          storage.price = node["Rent"];
          storage.size = node["Space"];
          storage.loc = node["Path"];
          storage.name = node["Name"];
          storage.description = node["Description"];
          storage.timings = node["Timings"];
          storage.fileExts = node["FileExt"].cast<String>();
          storage.files = node["Files"].cast<String>();
          storage.used = node["UsedSpace"];
          storage.duration = node["TimePeriod"];
          storage.rentDuration =
              node["RenteeDuration"].isEmpty ? "" : node["RenteeDuration"];
          storage.renteeId =
              node["RenterPrincipal"].isEmpty ? "" : node["RenterPrincipal"];

          storages.add(storage);
        }
      }
      return storages;
    } else {
      print(response.statusCode);
      print(response.body);
      return [];
    }
  }

  Future<void> rentStorage(Rent rent) async {
    const String url = "$apiUrl/add_rentee";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final Map<String, dynamic> body = {
      "storage_principal": rent.storageId,
      "rentee_principal": rent.renteeId,
      "duration": rent.rentDuration,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print("Storage rented");
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<List<List<String>>> getAccountStorages(String Id) async {
    String url = "$apiUrl/get_account?account_principal=$Id";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var result = response.body;

      final Map<String, dynamic> body = jsonDecode(result);
      List<String> ownedStorages = body["My_Storages"].cast<String>();
      List<String> rentedStorages = body["Rented_Storages"].cast<String>();

      return [ownedStorages, rentedStorages];
    } else {
      print(response.statusCode);
      print(response.body);
      return [[], []];
    }
  }

  void uploadFiles(String id, List<PlatformFile> files) async {
    try {
      String apiurl = "$apiUrl/add_file?id=$id";
      var request = http.MultipartRequest('POST', Uri.parse(apiurl));

      for (var ffile in files) {
        File file = File(ffile.path!);
        var fileBytes = await file.readAsBytes();
        var stream = http.ByteStream.fromBytes(fileBytes);
        var multipartFile = http.MultipartFile(
          'files',
          stream,
          await file.length(),
          filename: path.basename(file.path),
          contentType: MediaType('application', 'octet-stream'),
        );
        request.files.add(multipartFile);
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        // Request was successful
        var responseBody = await response.stream.bytesToString();
        print('Response: $responseBody');
      } else {
        print('Request failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<int> getFileSize(String downloadUrl) async {
    final response = await http.head(Uri.parse(downloadUrl));
    final contentLength = response.headers['content-length'];
    if (contentLength != null) {
      return int.parse(contentLength);
    } else {
      throw Exception('Failed to get file size');
    }
  }

  Future<void> deletefile(
    String id,
    String file,
  ) async {
    var size = 0;

    Document doc = await Firestore.instance.collection(id).document(file).get();
    String url = doc["downloadUrl"].toString();
    size = await getFileSize(url);
    String apiurl = "$apiUrl/delete_file?collectionId=$id&size=$size&docId=$file";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final http.Response response = await http.post(
      Uri.parse(apiurl),
      headers: headers,
    );

    if(response.statusCode == 200){
      print("File deleted");
    }else{
      print(response.statusCode);
    }
  }
}
