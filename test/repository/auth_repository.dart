import 'package:test/test.dart';
import '../../lib/repository/repository.dart';

void main() {
  /**
  * Write this test case to test fail login message
  */
  group('Verify OTP Response Test', () {
    String otp = "1234";
    String verificationDeviceId = "";

    test('Repository > Auth Repository', () async {
      AuthRepository authRepository = AuthRepository();
      await authRepository.verifyOTP(otp, verificationDeviceId).catchError((e) {
        expect(e, "Login Failed");
      });
    });
  });
}
