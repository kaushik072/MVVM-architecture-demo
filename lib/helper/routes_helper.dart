import 'package:flutter/material.dart';
import 'package:test_project/models/models.dart';
import 'package:test_project/ui/ui.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/SendOtpUI':
        return MaterialPageRoute(builder: (_) => SendOtpUI());
      case '/VerifyOtpUI':
        if (settings.arguments.runtimeType == MyAppUser) {
          return MaterialPageRoute(
            builder: (_) => VerifyOtpUI(
              myAppUser: settings.arguments as MyAppUser,
            ),
          );
        }
        return defaultWidget(settings.name);
      case '/HomePageUI':
        return MaterialPageRoute(builder: (_) => HomePageUI());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static defaultWidget(String? routename) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for $routename'),
        ),
      ),
    );
  }
}
