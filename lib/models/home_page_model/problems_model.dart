import 'package:test_project/models/home_page_model/home_page_model.dart';

class ProblemsModel {
  List<DiabetesModel>? diabetes;

  ProblemsModel({this.diabetes});

  ProblemsModel.fromJson(Map<String, dynamic> json) {
    if (json['Diabetes'] != null) {
      diabetes = [];
      json['Diabetes'].forEach((v) {
        diabetes!.add(DiabetesModel.fromJson(v));
      });
    }
  }
}
