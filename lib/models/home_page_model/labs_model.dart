class LabsModel {
  String? missingField;

  LabsModel({this.missingField});

  LabsModel.fromJson(Map<String, dynamic> json) {
    missingField = json['missing_field'];
  }
}
