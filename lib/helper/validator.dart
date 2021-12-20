class Validator {
  static String? isValidMobile(String? mobile) {
    if (mobile!.trim().length < 8) {
      return "Please enter valid mobile number";
    }
  }

  static String? isValidUserName(String? name) {
    if (name!.trim().length < 1) {
      return "Please enter valid user name";
    }
  }
}
