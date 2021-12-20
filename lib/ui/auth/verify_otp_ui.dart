import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import 'package:test_project/helper/helper.dart';
import 'package:test_project/models/models.dart';
import 'package:test_project/ui/components/components.dart';
import 'package:test_project/view_model/view_model.dart';

class VerifyOtpUI extends StatefulWidget {
  const VerifyOtpUI({Key? key, this.myAppUser}) : super(key: key);
  final MyAppUser? myAppUser;
  @override
  _VerifyOtpUIState createState() => _VerifyOtpUIState();
}

class _VerifyOtpUIState extends State<VerifyOtpUI> {
  TextEditingController _verifyOtpController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  late int endTime;

  @override
  void initState() {
    updateTime();
    super.initState();
  }

  updateTime() {
    DateTime _dateTime = DateTime.now().add(Duration(minutes: 2));
    endTime = _dateTime.millisecondsSinceEpoch;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    final size = MediaQuery.of(context).size;

    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: MyColor.lightBackground,
      borderRadius: BorderRadius.circular(5.0),
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 27),
                decoration: BoxDecoration(
                  color: MyColor.coreBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: Offset(0, 2), //(x,y)
                      blurRadius: 9,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 134,
                    ),
                    Text(
                      'Please enter verification code',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: 20,
                            color: MyColor.textPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Verification code send to',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            fontSize: 16,
                            color: MyColor.descriptionColor,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      widget.myAppUser!.mobileNumber ?? "",
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontSize: 20,
                          color: MyColor.textPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: PinPut(
                        eachFieldWidth: 30.0,
                        eachFieldHeight: 30.0,
                        withCursor: true,
                        fieldsCount: 6,
                        focusNode: _pinPutFocusNode,
                        controller: _verifyOtpController,
                        submittedFieldDecoration: pinPutDecoration,
                        selectedFieldDecoration: pinPutDecoration,
                        followingFieldDecoration: pinPutDecoration,
                        pinAnimationType: PinAnimationType.scale,
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: CommonButton(
                        onPress: () async {
                          if (_verifyOtpController.text.trim().length != 6) {
                            BotToast.showText(
                              text: "Please enter OTP",
                              contentColor: MyColor.warningColor!,
                            );
                            return;
                          }
                          final localDataStorage =
                              Provider.of<LocalDataStorage>(context,
                                  listen: false);
                          MyAppUser? myuser = await authViewModel.verifyOtp(
                              _verifyOtpController.text.trim(),
                              widget.myAppUser!.userName);
                          if (myuser != null) {
                            myuser.userName = widget.myAppUser!.userName;
                            localDataStorage.insertUser(myuser);
                          }
                        },
                        prefixPath: 'assets/images/svg/icon_arrow.svg',
                        title: 'Verify now',
                        textStyle:
                            Theme.of(context).textTheme.bodyText1?.copyWith(
                                  color: MyColor.textPrimaryLightColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                        color: MyColor.commonColorSet2,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
