import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import 'package:mobileapp_qa/varbles.dart';
import '../provider/admin_provider.dart';

class AuthController {
  Future<AdminModel> login(
      BuildContext context, String username, String password) async {
    print(apiURL);
    final response = await http.post(Uri.parse("$apiURL/api/admin/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "admin_username": username,
          "admin_password": password,
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('Response data: $data');
      AdminModel adminModel = AdminModel.fromJson(data);
      return adminModel;
    } else {
      throw Exception('Error: Invalid response structure');
    }
  }

  Future<void> register(BuildContext context, String username, String password,
      String Fname, String Lname, String tel, String email) async {
    final Map<String, dynamic> registerData = {
      "admin_username": username,
      "admin_password": password,
      "admin_Fname": Fname,
      "admin_Lname": Lname,
      "admin_tel": tel,
      "admin_email": email,
    };
    final response = await http.post(
      Uri.parse("$apiURL/api/admin/auth/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(registerData),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      print('Registration Successfuly');
    } else {
      print('Registration failed');
    }
  }

  Future<void> refreshToken(BuildContext context) async {
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    final response = await http.post(
      Uri.parse("$apiURL/api/admin/auth/refresh"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${adminProvider.refreshToken}",
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      final accessToken = data['accessToken'];
      adminProvider
          .updateAccessToken(accessToken); // Update to accept only accessToken
    } else if (response.statusCode == 401) {
      const accessToken = "";
      adminProvider
          .updateAccessToken(accessToken); // Update to accept only accessToken
    } else {
      throw Exception('Failed to refresh token');
    }
  }
}

// Define the AdminModel class
class AdminModel {
  String id;
  String adminId;
  String adminUsername;
  String adminFname;
  String adminLname;
  String adminTel;
  String adminEmail;
  DateTime createdAt;
  DateTime updatedAt;

  AdminModel({
    required this.id,
    required this.adminId,
    required this.adminUsername,
    required this.adminFname,
    required this.adminLname,
    required this.adminTel,
    required this.adminEmail,
    required this.createdAt,
    required this.updatedAt,
  });

  // Function to map JSON to AdminModel object
  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        id: json["_id"],
        adminId: json["admin_id"],
        adminUsername: json["admin_username"],
        adminFname: json["admin_Fname"],
        adminLname: json["admin_Lname"],
        adminTel: json["admin_tel"],
        adminEmail: json["admin_email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // Function to map AdminModel object to JSON
  Map<String, dynamic> toJson() => {
        "_id": id,
        "admin_id": adminId,
        "admin_username": adminUsername,
        "admin_Fname": adminFname,
        "admin_Lname": adminLname,
        "admin_tel": adminTel,
        "admin_email": adminEmail,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
