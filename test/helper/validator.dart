import 'package:test/test.dart';

import '../../lib/helper/helper.dart';

void main() {
  /**
   * Write this test case to test sign in form validation
   */

  group('Validator Test', () {

    test('Validator > Validate mobile number', () async {
      String mobile = "9685";
      String? isValidMobile = Validator.isValidMobile(mobile);
      expect(isValidMobile, "Please enter valid mobile number");
    });

    test('Validator > Validate mobile number', () async {
      String mobile = "9909999099";
      String? isValidMobile = Validator.isValidMobile(mobile);
      expect(isValidMobile, null);
    });

    test('Validator > Validate user name', () async {
      String userName = "";
      String? isValidUserName = Validator.isValidUserName(userName);
      expect(isValidUserName, "Please enter valid user name");
    });

    test('Validator > Validate user name', () async {
      String userName = "Test";
      String? isValidUserName = Validator.isValidUserName(userName);
      expect(isValidUserName, null);
    });

  });
}