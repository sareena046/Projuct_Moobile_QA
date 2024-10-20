import 'package:flutter/material.dart';
import 'package:mobileapp_qa/models/course_model.dart'; // ตรวจสอบให้แน่ใจว่าคุณมี CourseModel ที่ถูกต้อง

class CourseProvider extends ChangeNotifier {
  String? _id;
  String? _courseId;
  String? _courseCode;
  String? _courseName;
  int? _credits;
  String? _instructor;
  String? _groups;
  int? _accepting;
  DateTime? _createdAt;
  DateTime? _updatedAt;

  String? get id => _id;
  String? get courseId => _courseId;
  String? get courseCode => _courseCode;
  String? get courseName => _courseName;
  int? get credits => _credits;
  String? get instructor => _instructor;
  String? get groups => _groups;
  int? get accepting => _accepting;
  DateTime? get createdAt => _createdAt;
  DateTime? get updatedAt => _updatedAt;

  void getCourses(CourseModel courseModel) {
    _id = courseModel.id;
    _courseId = courseModel.courseId;
    _courseCode = courseModel.courseCode;
    _courseName = courseModel.courseName;
    _credits = courseModel.credits;
    _instructor = courseModel.instructor;
    _groups = courseModel.groups;
    _accepting = courseModel.accepting;
    _createdAt = courseModel.createdAt;
    _updatedAt = courseModel.updatedAt;

    notifyListeners(); // อัปเดตให้ UI รู้ว่ามีการเปลี่ยนแปลง
  }
}
