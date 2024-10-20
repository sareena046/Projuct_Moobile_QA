// ignore: unused_import
import 'dart:convert';

// Define the class
class FormModel {
  String id;
  String curriculum;
  String formId;
  String courseCode;
  String courseName;
  String credits;
  String group;
  String instructor;
  int a, bPlus, b, cPlus, c, dPlus, d, e, f, fPercent, i, w, vg, g, s, u, total;
  DateTime createdAt, updatedAt;

  FormModel({
    required this.id,
    required this.curriculum,
    required this.formId,
    required this.courseCode,
    required this.courseName,
    required this.credits,
    required this.group,
    required this.instructor,
    required this.a,
    required this.bPlus,
    required this.b,
    required this.cPlus,
    required this.c,
    required this.dPlus,
    required this.d,
    required this.e,
    required this.f,
    required this.fPercent,
    required this.i,
    required this.w,
    required this.vg,
    required this.g,
    required this.s,
    required this.u,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
  });

  // Function to map JSON to Course object
  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        id: json["_id"],
        curriculum: json["curriculum"],
        formId: json["form_id"],
        courseCode: json["coursecode_FK"],
        courseName: json["coursename_FK"],
        credits: json["credits_FK"],
        group: json["groups_FK"],
        instructor: json["instructor_FK"],
        a: json["A"],
        bPlus: json["B_plus"],
        b: json["B"],
        cPlus: json["C_plus"],
        c: json["C"],
        dPlus: json["D_plus"],
        d: json["D"],
        e: json["E"],
        f: json["F"],
        fPercent: json["F_percent"],
        i: json["I"],
        w: json["W"],
        vg: json["VG"],
        g: json["G"],
        s: json["S"],
        u: json["U"],
        total: json["total"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // Function to map Course object to JSON
  Map<String, dynamic> toJson() => {
        "_id": id,
        "curriculum": curriculum,
        "form_id": formId,
        "coursecode_FK": courseCode,
        "coursename_FK": courseName,
        "credits_FK": credits,
        "groups_FK": group,
        "instructor_FK": instructor,
        "A": a,
        "B_plus": bPlus,
        "B": b,
        "C_plus": cPlus,
        "C": c,
        "D_plus": dPlus,
        "D": d,
        "E": e,
        "F": f,
        "F_percent": fPercent,
        "I": i,
        "W": w,
        "VG": vg,
        "G": g,
        "S": s,
        "U": u,
        "total": total,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

// Example usage
// void main() {
//   String jsonData = '[{YOUR_JSON_DATA}]';
//   List<dynamic> parsedJson = json.decode(jsonData);
//   List<Course> courses = parsedJson.map((json) => Course.fromJson(json)).toList();

//   print(courses[0].courseName);
// }
