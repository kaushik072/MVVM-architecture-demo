import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_project/helper/helper.dart';
import 'package:test_project/models/models.dart';

class AuthRepository {
  NetworkHelper networkHelper = NetworkHelper();

  MyAppUser? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return MyAppUser(
      uid: user.uid,
      mobileNumber: user.phoneNumber,
      userName: user.displayName,
    );
  }

  /*
  * This function verify the otp
  * */
  Future<MyAppUser?> verifyOTP(String otp, String verificationDeviceId) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationDeviceId,
      smsCode: otp,
    );
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      throw "Login Failed";
    }
  }
}
