import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileapp_qa/models/user_model.dart';
import 'package:mobileapp_qa/provider/user_provider.dart';
import 'package:mobileapp_qa/varbles.dart';
import 'package:provider/provider.dart';

class AuthController {
  get http => null;

  Future<UserModel> login(
      BuildContext context, String username, String password) async {
    print(apiURL);
    final response = await http.post(
      Uri.parse("$apiURL/api/user/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "user_name": username,
        "password": password,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('Response data: $data');
      UserModel userModel = UserModel.fromJson(data);
      return userModel;
    } else {
      throw Exception('Error: Invalid response structure');
    }
  }

  Future<void> refreshToken(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final response = await http.post(
      Uri.parse("$apiURL/api/user/auth/refresh"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${userProvider.refreshToken}",
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      final accessToken = data['accessToken'];
      userProvider
          .updateAccessToken(accessToken); // Update to accept only accessToken
    } else if (response.statusCode == 401) {
      const accessToken = "";
      userProvider
          .updateAccessToken(accessToken); // Update to accept only accessToken
    }
  }
}
