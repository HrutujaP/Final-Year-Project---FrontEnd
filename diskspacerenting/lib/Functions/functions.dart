import 'dart:convert';

import 'package:diskspacerenting/models/account.dart';
import 'package:http/http.dart' as http;

class Functions {
  Future<Account> readAccountDetails(String id) async {
    Account account = Account();
    String apiUrl =
        "http://10.0.2.2:8080/api/account/get_account?account_principal=$id";

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
}
