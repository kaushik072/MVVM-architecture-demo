import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test_project/helper/helper.dart';
import 'package:test_project/models/my_app_user.dart';
import 'package:test_project/ui/components/components.dart';
import 'package:test_project/view_model/view_model.dart';

class SendOtpUI extends StatefulWidget {
  const SendOtpUI({Key? key}) : super(key: key);

  @override
  _SendOtpUIState createState() => _SendOtpUIState();
}

class _SendOtpUIState extends State<SendOtpUI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    MyAppUser myAppUser = MyAppUser();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: 27),
                  decoration: BoxDecoration(
                    color: MyColor.coreBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(0, 4),
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
                      SizedBox.fromSize(
                        child: Column(
                          children: [
                            Container(
                              height: 142,
                              width: MediaQuery.of(context).size.width - 34,
                            ),
                            Text(
                              "Sign In",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                    fontSize: 24,
                                    color: MyColor.textPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Sign In With mobile number in demo app",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: MyColor.descriptionColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Container(
                                height: 52,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: MyColor.lightBackground),
                                child: Column(
                                  children: [
                                    Row(
                                      textDirection: TextDirection.ltr,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 30,
                                          child: SvgPicture.asset(
                                            "assets/images/svg/user.svg",
                                            fit: BoxFit.scaleDown,
                                            color: MyColor.iconColor,
                                            height: 21,
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.84 - 110,
                                          height: 52,
                                          child: TextFormField(
                                            textDirection: TextDirection.ltr,
                                            validator:
                                                Validator.isValidUserName,
                                            onSaved: (String? name) {
                                              myAppUser.userName = name;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'User name',
                                              hintTextDirection:
                                                  TextDirection.ltr,
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(top: 9),
                                              hintStyle: TextStyle(
                                                color: MyColor.baseDarkColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: MyColor.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                //  height: 52,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: MyColor.lightBackground),
                                child: Column(
                                  children: [
                                    Row(
                                      textDirection: TextDirection.ltr,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 30,
                                          child: SvgPicture.asset(
                                            "assets/images/svg/phone.svg",
                                            fit: BoxFit.scaleDown,
                                            color: MyColor.iconColor,
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.84 - 110,
                                          height: 52,
                                          child: TextFormField(
                                            textDirection: TextDirection.ltr,
                                            keyboardType: TextInputType.phone,
                                            validator: Validator.isValidMobile,
                                            onSaved: (String? mobile) {
                                              myAppUser.mobileNumber = mobile;
                                            },
                                            decoration: InputDecoration(
                                              hintText: '+91 xxx xxxx',
                                              hintTextDirection:
                                                  TextDirection.ltr,
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(top: 9),
                                              hintStyle: TextStyle(
                                                color: MyColor.baseDarkColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: MyColor.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: CommonButton(
                          onPress: () async {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              authViewModel.sendOtp(
                                context: context,
                                mobileNumber: myAppUser.mobileNumber ?? "",
                                userName: myAppUser.userName ?? "",
                              );
                            }
                          },
                          prefixPath: 'assets/images/svg/icon_arrow.svg',
                          title: "Send Otp",
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
                  height: 44,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
