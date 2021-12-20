import 'package:test_project/models/home_page_model/home_page_model.dart';

class MedicationsClassesModel {
  List<ClassNameModel>? className;
  List<ClassNameModel>? className2;

  MedicationsClassesModel({this.className, this.className2});

  MedicationsClassesModel.fromJson(Map<String, dynamic> json) {
    if (json['className'] != null) {
      className = [];
      json['className'].forEach((v) {
        className!.add(ClassNameModel.fromJson(v));
      });
    }
    if (json['className2'] != null) {
      className2 = [];
      json['className2'].forEach((v) {
        className2!.add(ClassNameModel.fromJson(v));
      });
    }
  }
}
