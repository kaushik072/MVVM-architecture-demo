import 'package:flutter/material.dart';
import 'package:test_project/models/models.dart';
import 'package:test_project/ui/ui.dart';

/*
* Builds the signed-in or non signed-in UI, depending on the user snapshot.
* This widget should be below the [MaterialApp].
* */
class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key, required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<MyAppUser?> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? HomePageUI() : SendOtpUI();
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
