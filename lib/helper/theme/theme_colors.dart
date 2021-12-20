import 'dart:ui';
import 'package:flutter/material.dart';

class MyColor {
  MyColor._();

  /* 
  * Main Color
  */
  static Color? mainColor;
  static Color? mainColorWithWhite;
  static Color? mainColorWithBlack;
  static Color? mainDarkColor;
  static Color? mainLightColor;
  static Color? mainLightColorWithBlack;
  static Color? mainLightColorWithWhite;
  static Color? mainShadowColor;
  static Color? mainLightShadowColor;
  static Color? mainDividerColor;
  static Color? whiteColorWithBlack;
  static Color? rowDescription;
  static Color? binBackground;
  static Color? yourOrder;
  static Color? commonColorSet1;
  static Color? commonColorSet2;
  static Color? timeFrameColor;
  static Color? commonTitleColor;
  static Color? addCardText;
  static Color? bottomNavBar;

  /* 
  * Base Color
  */
  static Color? baseColor;
  static Color? baseDarkColor;
  static Color? baseLightColor;

  /* 
  * Text Color
  */
  static Color? textPrimaryColor;
  static Color? textPrimaryDarkColor;
  static Color? textSecondaryLightColor;
  static Color? textSecondarySecondLightColor;
  static Color? textPrimaryLightColor;
  static Color? descriptionColor;
  static Color? textPrimaryColorForLight;
  static Color? textPrimaryDarkColorForLight;
  static Color? textPrimaryLightColorForLight;
  static Color? aboutUsDescription;
  static Color? subTitle;

  /* 
  * Icon Color
  */
  static Color? iconColor;

  /* 
  * Background Color
  */
  static Color? coreBackgroundColor;
  static Color? backgroundColor;

  /* 
  * General
  */
  static Color? white;
  static Color? black;
  static Color? grey;
  static Color? transparent;

  /* 
  * Error Color
  * */
  static Color? warningColor;

  /* 
  * Light Theme
  */
  static const Color _l_base_color = Color(0xFFFFFFFF);
  static const Color _l_base_dark_color = Color(0xffFA6BCD0);
  static const Color _l_base_light_color = Color(0xFFEFEFEF);

  static const Color _l_text_primary_light_color = Color(0xFFFFFFFF);
  static const Color _l_text_primary_color = Color(0xff3F305E);
  static const Color _l_text_primary_dark_color = Color(0xff748A9D);
  static const Color _l_text_secondary_second_dark_color = Color(0xffA6BCD0);

  static const Color _l_divider_color = Color(0x15505050);

  /* 
  * Dark Theme
  */
  static const Color _d_base_color = Color(0xFF212121);
  static const Color _d_base_dark_color = Color(0xFF303030);
  static const Color _d_base_light_color = Color(0xFF454545);

  static const Color _d_text_primary_color = Color(0xFFFFFFFF);
  static const Color _d_text_primary_light_color = Color(0xFFFFFFFF);
  static const Color _d_text_primary_dark_color = Color(0xFFFFFFFF);

  static const Color _d_divider_color = Color(0x1FFFFFFF);

  /* 
  * Common Theme
  */

  static final Color darkBlue = Color(0xff3F305E);
  static final Color darkYellow = Color(0xFFB3874B);

  static final Color lightBackground = Color(0xffF0F4F8);
  static final Color lightBlue = Color(0xffFA6BCD0);
  static final Color switchColor = Color(0xff748A9D);

  static const Color _c_main_color = Color(0xFFFFFFFF);
  static const Color _c_main_light_color = _c_black_color;
  static const Color _c_main_dark_color = Color(0xff2196F3);

  static const Color _c_white_color = Colors.white;
  static const Color _c_black_color = Colors.black;
  static const Color _c_grey_color = Colors.grey;
  static const Color _c_transparent_color = Colors.transparent;

  static Color lightShimmerBaseColor = Colors.grey[200]!;
  static Color lightShimmerHighlightColor = Colors.grey[300]!;

  static const Color _c_alert_color = Colors.red;

  static void _loadDarkColors() {
    /* 
    * Main Color
    * */
    mainColor = switchColor;
    mainColorWithWhite = Colors.white;
    mainColorWithBlack = grey;
    mainDarkColor = _c_main_dark_color;
    mainLightColor = _c_main_light_color;
    mainLightColorWithBlack = _d_base_color;
    mainLightColorWithWhite = Colors.white;
    mainShadowColor = Colors.white12;
    mainLightShadowColor = Colors.black.withOpacity(0.5);
    mainDividerColor = _d_divider_color;
    whiteColorWithBlack = Colors.black;

    /*
    * Base Color
    */
    baseColor = _d_base_color;
    baseDarkColor = _d_base_dark_color;
    baseLightColor = _d_base_light_color;

    /* 
    * Text Color
    */
    textPrimaryColor = _d_text_primary_color;
    textPrimaryDarkColor = _d_text_primary_dark_color;
    textSecondaryLightColor = _d_text_primary_light_color;
    textSecondarySecondLightColor = _d_text_primary_light_color;
    textPrimaryLightColor = _d_text_primary_light_color;
    descriptionColor = _d_text_primary_light_color;
    rowDescription = _d_text_primary_light_color;
    binBackground = _d_text_primary_light_color;
    aboutUsDescription = _d_text_primary_light_color;
    yourOrder = _d_text_primary_light_color;
    commonColorSet1 = Color(0xFF0C284C);
    commonColorSet2 = Color(0xFFB3874B);
    timeFrameColor = _d_text_primary_light_color;
    commonTitleColor = Colors.white;
    subTitle = Colors.white;
    addCardText = Colors.white;
    bottomNavBar = Colors.white;

    textPrimaryColorForLight = _l_text_primary_color;
    textPrimaryDarkColorForLight = _l_text_primary_dark_color;
    textPrimaryLightColorForLight = _l_text_primary_light_color;

    /* 
    * Icon Color
    */
    iconColor = _d_base_dark_color;

    /* 
    * Background Color
    */
    coreBackgroundColor = _d_base_color;
    backgroundColor = _d_base_dark_color;

    /* 
    * General
    */
    white = _c_white_color;
    black = _c_black_color;
    grey = _c_grey_color;
    transparent = _c_transparent_color;

    /* 
    *  Alert
    * */
    warningColor = _c_alert_color;
  }

  static void _loadLightColors() {
    /* 
    *  Main Color
    */
    mainColor = lightBackground;
    mainColorWithWhite = darkBlue;
    mainColorWithBlack = _c_main_color;
    mainDarkColor = _c_main_dark_color;
    mainLightColor = _c_main_light_color;
    mainLightColorWithBlack = _c_main_light_color;
    mainLightColorWithWhite = _c_main_light_color;
    mainShadowColor = _c_main_color.withOpacity(0.6);
    mainLightShadowColor = _c_main_light_color;
    mainDividerColor = _l_divider_color;
    whiteColorWithBlack = _c_white_color;
    descriptionColor = Colors.black.withOpacity(0.6);
    rowDescription = Color(0xFF748A9D);
    binBackground = Color(0xFFA6BCD0);
    aboutUsDescription = Color(0xFF748A9D);
    yourOrder = Color(0xFF748A9D);
    commonColorSet1 = Color(0xFF0C284C);
    commonColorSet2 = Color(0xFFB3874B);
    commonTitleColor = Color(0xFF0C284C);
    subTitle = Color(0xFF748A9D);
    addCardText = Color(0xFF748A9D);
    bottomNavBar = Color(0xFF0C284C);

    /* 
    *  Base Color
    */
    baseColor = _l_base_color;
    baseDarkColor = _l_base_dark_color;
    baseLightColor = _l_base_light_color;

    /* 
    *  ext Color
    */
    textPrimaryColor = _l_text_primary_color;
    textPrimaryDarkColor = _l_text_primary_dark_color;
    textSecondaryLightColor = Colors.black;
    textSecondarySecondLightColor = _l_text_secondary_second_dark_color;
    textPrimaryLightColor = _l_text_primary_light_color;
    timeFrameColor = Color(0xff748A9D);

    /* 
    * Icon Color
    */
    iconColor = Color(0xFF0C284C);

    /* 
    *   Background Color
    */
    coreBackgroundColor = _l_base_color;
    backgroundColor = _l_base_dark_color;

    /* 
    *  General
    * */
    white = _c_white_color;
    black = _c_black_color;
    grey = _c_grey_color;
    transparent = _c_transparent_color;

    /* 
    *  Alert
    * */
    warningColor = _c_alert_color;
  }

  static void loadColor2(bool isLightMode) {
    if (isLightMode) {
      _loadLightColors();
    } else {
      _loadDarkColors();
    }
  }
}
