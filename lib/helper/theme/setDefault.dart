import 'package:flutter/material.dart';
import '../helper.dart';

ThemeData themeData(ThemeData baseTheme, int isTheme, BuildContext context) {
  //final baseTheme = ThemeData.light();

  // var lang = Localizations.localeOf(context).languageCode;
  // String font = lang == "en" ? "Helvetica" : "TheSans";

  if (isTheme == 1) {
    MyColor.loadColor2(false);
    return baseTheme.copyWith(
      primaryColor: MyColor.mainColor,
      primaryColorDark: MyColor.mainDarkColor,
      primaryColorLight: MyColor.mainLightColor,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: MyColor.textPrimaryColor,
        ),
        headline2: TextStyle(
          color: MyColor.textPrimaryColor,
        ),
        headline3: TextStyle(
          color: MyColor.textPrimaryColor,
        ),
        headline4: TextStyle(
          color: MyColor.textPrimaryColor,
        ),
        headline5: TextStyle(
            color: MyColor.textPrimaryColor, fontWeight: FontWeight.bold),
        headline6: TextStyle(
          color: MyColor.textPrimaryColor,
        ),
        subtitle1: TextStyle(
            color: MyColor.textPrimaryColor, fontWeight: FontWeight.bold),
        subtitle2: TextStyle(
            color: MyColor.textPrimaryColor, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
          color: MyColor.textPrimaryColor,
        ),
        bodyText2: TextStyle(
            color: MyColor.textPrimaryColor, fontWeight: FontWeight.bold),
        button: TextStyle(
          color: MyColor.textPrimaryColor,
        ),
        caption: TextStyle(
          color: MyColor.textPrimaryLightColor,
        ),
        overline: TextStyle(
          color: MyColor.textPrimaryColor,
        ),
      ),
      iconTheme: IconThemeData(color: MyColor.iconColor),
      appBarTheme: AppBarTheme(color: MyColor.coreBackgroundColor),
    );
  } else {
    MyColor.loadColor2(true);
    // White Theme
    return baseTheme.copyWith(
        primaryColor: MyColor.mainColor,
        primaryColorDark: MyColor.mainDarkColor,
        primaryColorLight: MyColor.mainLightColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: MyColor.textPrimaryColor,
          ),
          headline2: TextStyle(
            color: MyColor.textPrimaryColor,
          ),
          headline3: TextStyle(
            color: MyColor.textPrimaryColor,
          ),
          headline4: TextStyle(
            color: MyColor.textPrimaryColor,
          ),
          headline5: TextStyle(
              color: MyColor.textPrimaryColor, fontWeight: FontWeight.bold),
          headline6: TextStyle(
            color: MyColor.textPrimaryColor,
          ),
          subtitle1: TextStyle(
              color: MyColor.textPrimaryColor, fontWeight: FontWeight.bold),
          subtitle2: TextStyle(
              color: MyColor.textPrimaryColor, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
            color: MyColor.textPrimaryColor,
          ),
          bodyText2: TextStyle(
              color: MyColor.textPrimaryColor, fontWeight: FontWeight.bold),
          button: TextStyle(
            color: MyColor.textPrimaryColor,
          ),
          caption: TextStyle(
            color: MyColor.textPrimaryLightColor,
          ),
          overline: TextStyle(
            color: MyColor.textPrimaryColor,
          ),
        ),
        iconTheme: IconThemeData(color: MyColor.iconColor),
        appBarTheme: AppBarTheme(color: MyColor.coreBackgroundColor));
  }
}
