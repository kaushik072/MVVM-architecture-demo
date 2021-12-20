import 'package:bot_toast/bot_toast.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:test_project/helper/routes_helper.dart';
import 'package:test_project/ui/ui.dart';

import 'helper/helper.dart';
import 'helper/network_helper.dart';
import 'models/models.dart';
import 'view_model/view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeCollection = ThemeCollection(
      themes: {
        AppThemes.Dark: themeData(ThemeData.dark(), 1, context),
        AppThemes.Light: themeData(ThemeData.light(), 0, context),
      },
      fallbackTheme: ThemeData.light(),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NetworkHelper(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalDataStorage(),
        ),
        //
      ],
      child: DynamicTheme(
        themeCollection: themeCollection,
        defaultThemeId: AppThemes.Light,
        builder: (context, theme) {
          return AuthWidgetBuilder(builder:
              (BuildContext context, AsyncSnapshot<MyAppUser?> userSnapshot) {
            return MaterialApp(
              title: 'Demo App',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Routes.generateRoute,
              home: AuthWidget(
                userSnapshot: userSnapshot,
              ),
              navigatorObservers: [BotToastNavigatorObserver()],
              builder: BotToastInit(),
            );
          });
        },
      ),
    );
  }
}
