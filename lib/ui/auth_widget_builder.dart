import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/models/models.dart';
import 'package:test_project/view_model/view_model.dart';

/// Used to create user-dependent objects that need to be accessible by all widgets.
/// This widgets should live above the [MaterialApp].
/// See [AuthWidget], a descendant widget that consumes the snapshot generated by this builder.
class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<MyAppUser?>) builder;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthViewModel>(context, listen: false);
    return StreamBuilder<MyAppUser?>(
      stream: authService.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<MyAppUser?> snapshot) {
        final MyAppUser? user = snapshot.data;
        if (user != null) {
          return MultiProvider(
            providers: [
              Provider<MyAppUser>.value(value: user),
            ],
            child: builder(context, snapshot),
          );
        }
        return builder(context, snapshot);
      },
    );
  }
}
