import 'dart:convert';

import 'package:diskspacerenting/models/account.dart';
import 'package:diskspacerenting/models/storage.dart';
import 'package:diskspacerenting/screens/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Functions {
  Future<Account> readAccountDetails(String id) async {
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
      final Map<String, dynamic> body = jsonDecode(response.body);
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
      print(response.body);

      setUser(response.body);
      // ignore: use_build_context_synchronously
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? id = prefs.getString("Id");
      Account account = Account();
      if (id != null) {
        Functions function = Functions();
        account = await function.readAccountDetails(id);
      }
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            account: account,
          ),
        ),
      );
    } else {
      print(response.body);
      print(response.statusCode);
    }
  }
}
