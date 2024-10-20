import 'package:flutter/material.dart';
import 'package:mobileapp_qa/models/form_model.dart';

class FormProvider extends ChangeNotifier {
  String? _id;
  String? _curriculum;
  String? _formId;
  String? _courseCode;
  String? _courseName;
  String? _credits;
  String? _group;
  String? _instructor;
  int? _a,
      _bPlus,
      _b,
      _cPlus,
      _c,
      _dPlus,
      _d,
      _e,
      _f,
      _fPercent,
      _i,
      _w,
      _vg,
      _g,
      _s,
      _u,
      _total;
  DateTime? _createdAt, _updatedAt;

  String? get id => _id;
  String? get curriculum => _curriculum;
  String? get formId => _formId;
  String? get courseCode => _courseCode;
  String? get courseName => _courseName;
  String? get credits => _credits;
  String? get group => _group;
  String? get instructor => _instructor;
  int? get a => _a;
  int? get bPlus => _bPlus;
  int? get b => _b;
  int? get cPlus => _cPlus;
  int? get c => _c;
  int? get dPlus => _dPlus;
  int? get d => _d;
  int? get e => _e;
  int? get f => _f;
  int? get fPercent => _fPercent;
  int? get i => _i;
  int? get w => _w;
  int? get vg => _vg;
  int? get g => _g;
  int? get s => _s;
  int? get u => _u;
  int? get total => _total;
  DateTime? get createdAt => _createdAt;
  DateTime? get updatedAt => _updatedAt;

  void getForms(FormModel formModel) {
    _id = formModel.id;
    _curriculum = formModel.curriculum;
    _formId = formModel.formId;
    _courseCode = formModel.courseCode;
    _courseName = formModel.courseName;
    _credits = formModel.credits;
    _group = formModel.group;
    _instructor = formModel.instructor;
    _a = formModel.a;
    _bPlus = formModel.bPlus;
    _b = formModel.b;
    _cPlus = formModel.cPlus;
    _c = formModel.c;
    _dPlus = formModel.dPlus;
    _d = formModel.d;
    _e = formModel.e;
    _f = formModel.f;
    _fPercent = formModel.fPercent;
    _i = formModel.i;
    _w = formModel.w;
    _vg = formModel.vg;
    _g = formModel.g;
    _s = formModel.s;
    _u = formModel.u;
    _total = formModel.total;
    _createdAt = formModel.createdAt;
    _updatedAt = formModel.updatedAt;

    notifyListeners(); // อัปเดตให้ UI รู้ว่ามีการเปลี่ยนแปลง
  }
}
