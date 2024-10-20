// ignore: unused_import
import 'dart:convert';

// Define the class
class CourseModel {
  String id;
  String courseId;
  String courseCode;
  String courseName;
  int credits;
  String instructor;
  String groups;
  int accepting;
  DateTime createdAt;
  DateTime updatedAt;

  CourseModel({
    required this.id,
    required this.courseId,
    required this.courseCode,
    required this.courseName,
    required this.credits,
    required this.instructor,
    required this.groups,
    required this.accepting,
    required this.createdAt,
    required this.updatedAt,
  });

  // Function to map JSON to Course object
  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["_id"],
        courseId: json["course_id"],
        courseCode: json["coursecode"],
        courseName: json["coursename"],
        credits: json["credits"],
        instructor: json["instructor"],
        groups: json["groups"],
        accepting: json["accepting"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // Function to map Course object to JSON
  Map<String, dynamic> toJson() => {
        "_id": id,
        "course_id": courseId,
        "coursecode": courseCode,
        "coursename": courseName,
        "credits": credits,
        "instructor": instructor,
        "groups": groups,
        "accepting": accepting,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

// Example usage
// void main() {
//   String jsonData = '{YOUR_JSON_DATA}';
//   Map<String, dynamic> parsedJson = json.decode(jsonData);
//   Course course = Course.fromJson(parsedJson);

//   print(course.courseName);
// }
