import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp_qa/models/form_model.dart'; // ตรวจสอบให้แน่ใจว่าคุณสร้าง FormModel เหมือนกับ UserModel หรือ CourseModel
import 'package:mobileapp_qa/varbles.dart';

class FormService {
  Future<FormModel> createForm(BuildContext context, FormModel form) async {
    final response = await http.post(
      Uri.parse('$apiURL/api/admin/form/newform'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(form.toJson()),
    );

    if (response.statusCode == 201) {
      return FormModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('สร้างฟอร์มไม่สำเร็จ');
    }
  }

  Future<List<FormModel>> getForms(BuildContext context) async {
    final response =
        await http.get(Uri.parse('$apiURL/api/admin/form/viewforms'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => FormModel.fromJson(item)).toList();
    } else {
      throw Exception('ไม่สามารถโหลดฟอร์มได้');
    }
  }

  Future<FormModel> getForm(BuildContext context, String formId) async {
    final response =
        await http.get(Uri.parse('$apiURL/api/admin/form/viewform/$formId'));

    if (response.statusCode == 200) {
      return FormModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ไม่สามารถโหลดฟอร์มได้');
    }
  }

  Future<FormModel> updateForm(
      BuildContext context, String formId, FormModel form) async {
    final response = await http.put(
      Uri.parse('$apiURL/api/admin/form/up/$formId'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(form.toJson()),
    );

    if (response.statusCode == 200) {
      return FormModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ไม่สามารถอัปเดตฟอร์มได้');
    }
  }

  Future<void> deleteForm(BuildContext context, String formId) async {
    final response =
        await http.delete(Uri.parse('$apiURL/api/admin/form/de/$formId'));

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('ไม่สามารถลบฟอร์มได้');
    }
  }
}
