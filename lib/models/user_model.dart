// ignore: unused_import
import 'dart:convert';

// Define the User class
class UserModel {
  User user;
  String accessToken;
  String refreshToken;

  UserModel({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required String userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        userId: '',
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class User {
  String id;
  String userId;
  String userPrefix;
  String userFname;
  String userLname;
  String userName;
  String password;
  String role;
  String userPhone;
  String userEmail;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.userId,
    required this.userPrefix,
    required this.userFname,
    required this.userLname,
    required this.userName,
    required this.password,
    required this.role,
    required this.userPhone,
    required this.userEmail,
    required this.createdAt,
    required this.updatedAt,
  });

  // Function to map JSON to User object
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        userId: json["user_id"],
        userPrefix: json["user_prefix"],
        userFname: json["user_Fname"],
        userLname: json["user_Lname"],
        userName: json["user_name"],
        password: json["password"],
        role: json["role"],
        userPhone: json["user_phone"],
        userEmail: json["user_email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // Function to map User object to JSON
  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "user_prefix": userPrefix,
        "user_Fname": userFname,
        "user_Lname": userLname,
        "user_name": userName,
        "password": password,
        "role": role,
        "user_phone": userPhone,
        "user_email": userEmail,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
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
//   User user = User.fromJson(parsedJson["user"]);
//   Token token = Token.fromJson(parsedJson);
//   print(user.userName);
//   print(token.accessToken);
// }
