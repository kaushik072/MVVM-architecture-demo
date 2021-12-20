import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/helper/helper.dart';
import 'package:test_project/models/models.dart';
import 'package:test_project/repository/repository.dart';

class AuthViewModel with ChangeNotifier {
  AuthRepository authRepository = AuthRepository();
  NetworkHelper networkHelper = NetworkHelper();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  MyAppUser? myAppUser;
  String? verificationDeviceId;

  MyAppUser? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    myAppUser = MyAppUser(
      uid: user.uid,
      mobileNumber: user.phoneNumber,
      userName: user.displayName,
    );
    return myAppUser;
  }

  Stream<MyAppUser?> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  /*
  * Following function send otp to given mobile number
  * Note: we can not add this function in repository as we are unable to
  *       get verificationDeviceId using await also
  * */
  sendOtp(
      {required String mobileNumber,
      required String userName,
      required BuildContext context}) async {
    try {
      if (await networkHelper.isInternet()) {
        print("mobileNumber $mobileNumber userName $userName");
        BotToast.showLoading();
        final PhoneCodeSent smsOTPSent = (String verId, int? forceCodeResend) {
          verificationDeviceId = verId;
          BotToast.cleanAll();
          Navigator.pushNamed(
            context,
            '/VerifyOtpUI',
            arguments: MyAppUser(
              mobileNumber: mobileNumber,
              userName: userName,
              uid: "",
            ),
          );
          notifyListeners();
        };
        await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: '$mobileNumber',
          codeAutoRetrievalTimeout: (String verId) {
            verificationDeviceId = verId;
            notifyListeners();
          },
          codeSent: smsOTPSent,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            BotToast.cleanAll();
            notifyListeners();
          },
          verificationFailed: (exceptio) {
            BotToast.cleanAll();
            notifyListeners();
          },
        );
      }
    } catch (e) {
      print("error $e");
    }
  }

  /*
  * Following function verify Otp and Return MyAppUser object
  * */
  Future<MyAppUser?> verifyOtp(String otp, String? userName) async {
    try {
      BotToast.showLoading();
      final user =
          await authRepository.verifyOTP(otp, verificationDeviceId ?? "");
      myAppUser = user;
      BotToast.closeAllLoading();
      return user;
    } catch (e) {
      BotToast.showText(
        text: "Please enter correct Otp",
        contentColor: MyColor.warningColor!,
      );
    } finally {
      BotToast.closeAllLoading();
    }
  }

  /*
  * Following function logout user
  * */
  Future<bool> logOut() async {
    try {
      await _firebaseAuth.signOut();
      myAppUser = null;
      return true;
    } catch (e) {
      return false;
    }
  }
}
