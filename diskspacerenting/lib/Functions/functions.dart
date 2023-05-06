// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/rent.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/GoogleSignInScreen/googleSignInScreen.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Functions {
  Future<Account?> readAccountDetails(String id) async {
    Account account = Account();
    // String apiUrl =
    //     "http://10.0.2.2:8080/api/account/get_account?account_principal=$id";
    String apiUrl =
        "http://localhost:8080/api/account/get_account?account_principal=$id";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );

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

    return account;
  }

  Future<String> createStorage(Storage strorage) async {
    const String apiUrl = "http://localhost:8080/api/account/create_storage";
    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final Map<String, String> body = {
      "rent": strorage.price,
      "owner_principal": strorage.ownerId,
      "storage_size": strorage.size,
      "path": strorage.loc,
      "timeperiod": strorage.duration
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
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
    // const String apiUrl = "http://10.0.2.2:8080/api/account/create_account";
    const String apiUrl = "http://localhost:8080/api/account/create_account";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final Map<String, dynamic> body = {
      "email": email,
      "name": name,
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
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
        // ignore: use_build_context_synchronously
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

    const String apiUrl =
        "http://localhost:8080/api/account/get_available_storages";
    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var result = response.body;

      for (var node in jsonDecode(result)) {
        if (min < int.parse(node["Space"]) &&
            int.parse(node["Space"]) <= limit) {
          Storage storage = Storage();
          storage.id = node["Id"];
          storage.ownerId = node["OwnerPrincipal"];
          storage.price = node["Rent"];
          storage.size = node["Space"];
          storage.loc = node["Path"];
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
    const String apiUrl = "http://localhost:8080/api/account/add_rentee";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final Map<String, dynamic> body = {
      "storage_principal":
          rent.storageId,
      "rentee_principal":
          rent.renteeId,
      "duration": rent.rentDuration,
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
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

  Future<List<List<String>>> getAccountStorages(String Id)async{

    String apiUrl =
        "http://localhost:8080/api/account/get_account?account_principal=$Id";

    final Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8",
    };

    final http.Response response = await http.get(
      Uri.parse(apiUrl),
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
      return [[],[]];
    }
  }
}
