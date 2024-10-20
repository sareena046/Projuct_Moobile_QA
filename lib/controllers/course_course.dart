import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp_qa/models/course_model.dart'; // ตรวจสอบให้แน่ใจว่าคุณสร้าง CourseModel เช่นเดียวกับ UserModel
import 'package:mobileapp_qa/varbles.dart';

class CourseService {
  Future<CourseModel> createCourse(
      BuildContext context, CourseModel course) async {
    final response = await http.post(
      Uri.parse('$apiURL/api/admin/course/newcourse'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(course.toJson()),
    );

    if (response.statusCode == 201) {
      return CourseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('สร้างคอร์สไม่สำเร็จ');
    }
  }

  Future<List<CourseModel>> getCourses(BuildContext context) async {
    final response =
        await http.get(Uri.parse('$apiURL/api/admin/course/viewcourses'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => CourseModel.fromJson(item)).toList();
    } else {
      throw Exception('ไม่สามารถโหลดคอร์สได้');
    }
  }

  Future<CourseModel> getCourse(BuildContext context, String courseId) async {
    final response = await http
        .get(Uri.parse('$apiURL/api/admin/course/viewcourse/$courseId'));

    if (response.statusCode == 200) {
      return CourseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ไม่สามารถโหลดคอร์สได้');
    }
  }

  Future<CourseModel> updateCourse(
      BuildContext context, String courseId, CourseModel course) async {
    final response = await http.put(
      Uri.parse('$apiURL/api/admin/course/upd/$courseId'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(course.toJson()),
    );

    if (response.statusCode == 200) {
      return CourseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ไม่สามารถอัปเดตคอร์สได้');
    }
  }

  Future<void> deleteCourse(BuildContext context, String courseId) async {
    final response =
        await http.delete(Uri.parse('$apiURL/api/admin/course/del/$courseId'));

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('ไม่สามารถลบคอร์สได้');
    }
  }
}
