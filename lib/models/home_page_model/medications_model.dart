import 'home_page_model.dart';

class MedicationsModel {
  List<MedicationsClassesModel>? medicationsClasses;

  MedicationsModel({this.medicationsClasses});

  MedicationsModel.fromJson(Map<String, dynamic> json) {
    if (json['medicationsClasses'] != null) {
      medicationsClasses = [];
      json['medicationsClasses'].forEach((v) {
        medicationsClasses!.add(MedicationsClassesModel.fromJson(v));
      });
    }
  }
}
