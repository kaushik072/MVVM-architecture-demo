class MyAppUser {
  MyAppUser({
    this.uid,
    this.userName,
    this.mobileNumber,
  });

  String? uid;
  String? mobileNumber;
  String? userName;

  MyAppUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    mobileNumber = json['mobileNumber'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uid'] = uid;
    data['mobileNumber'] = mobileNumber;
    data['userName'] = userName;
    return data;
  }
}
