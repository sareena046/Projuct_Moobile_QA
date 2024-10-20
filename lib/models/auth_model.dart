// ignore: unused_import
import 'dart:convert';

// Define the Admin class
class AdminModel {
  Admin admin;
  String accessToken;
  String refreshToken;

  AdminModel({
    required this.admin,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        admin: Admin.fromJson(json["admin"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin.toJson(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class Admin {
  String id;
  String adminId;
  String adminUsername;
  String adminFname;
  String adminLname;
  String adminTel;
  String adminEmail;
  // DateTime createdAt;
  // DateTime updatedAt;

  Admin({
    required this.id,
    required this.adminId,
    required this.adminUsername,
    required this.adminFname,
    required this.adminLname,
    required this.adminTel,
    required this.adminEmail,
    // required this.createdAt,
    // required this.updatedAt,
  });

  // Function to map JSON to Admin object
  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["_id"],
        adminId: json["admin_id"],
        adminUsername: json["admin_username"],
        adminFname: json["admin_Fname"],
        adminLname: json["admin_Lname"],
        adminTel: json["admin_tel"],
        adminEmail: json["admin_email"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // Function to map Admin object to JSON
  Map<String, dynamic> toJson() => {
        "_id": id,
        "admin_id": adminId,
        "admin_username": adminUsername,
        "admin_Fname": adminFname,
        "admin_Lname": adminLname,
        "admin_tel": adminTel,
        "admin_email": adminEmail,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
      };
}

// Define the Token class
class Token {
  String accessToken;
  String refreshToken;

  Token({
    required this.accessToken,
    required this.refreshToken,
  });

  // Function to map JSON to Token object
  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  // Function to map Token object to JSON
  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

// Example usage
// void main() {
//   String jsonData = '{YOUR_JSON_DATA}';
//   Map<String, dynamic> parsedJson = json.decode(jsonData);

//   Admin admin = Admin.fromJson(parsedJson["admin"]);
//   Token token = Token.fromJson(parsedJson);

//   print(admin.adminUsername);
//   print(token.accessToken);
// }
