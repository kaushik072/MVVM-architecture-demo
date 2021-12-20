import 'package:test_project/models/home_page_model/labs_model.dart';
import 'package:test_project/models/home_page_model/medications_model.dart';

class DiabetesModel {
  List<MedicationsModel>? medications;
  List<LabsModel>? labs;

  DiabetesModel({this.medications, this.labs});

  DiabetesModel.fromJson(Map<String, dynamic> json) {
    if (json['medications'] != null) {
      medications = [];
      json['medications'].forEach((v) {
        medications!.add(MedicationsModel.fromJson(v));
      });
    }
    if (json['labs'] != null) {
      labs = [];
      json['labs'].forEach((v) {
        labs!.add(LabsModel.fromJson(v));
      });
    }
  }
}
