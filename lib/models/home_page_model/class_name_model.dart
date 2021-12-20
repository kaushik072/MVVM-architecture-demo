import 'package:test_project/models/home_page_model/associated_drug_model.dart';

class ClassNameModel {
  List<AssociatedDrugModel>? associatedDrug;
  List<AssociatedDrugModel>? associatedDrug2;

  ClassNameModel({this.associatedDrug, this.associatedDrug2});

  ClassNameModel.fromJson(Map<String, dynamic> json) {
    if (json['associatedDrug'] != null) {
      associatedDrug = [];
      json['associatedDrug'].forEach((v) {
        associatedDrug!.add(AssociatedDrugModel.fromJson(v));
      });
    }
    if (json['associatedDrug#2'] != null) {
      associatedDrug2 = [];
      json['associatedDrug#2'].forEach((v) {
        associatedDrug2!.add(AssociatedDrugModel.fromJson(v));
      });
    }
  }
}
