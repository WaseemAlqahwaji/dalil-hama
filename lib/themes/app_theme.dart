import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/dynamic_svg_ext.dart';
import 'package:dalil_hama/generated/generated_assets/assets.gen.dart';
import 'package:flutter/material.dart';

import 'app_colors_shema.dart';

class AppTheme {
  final AppColorsSchema _schema;

  AppTheme(this._schema);

  ThemeData getThemeData({String? fontFamily}) => ThemeData(
    fontFamily: fontFamily,
    primaryColor: _schema.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _schema.primaryColor,
      brightness: _schema.brightness,
      error: _schema.red,
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => CircleButton(
        padding: EdgeInsets.all(8),
        icon: Assets.icons.back.dynamicSVGColor(context),
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    cardColor: _schema.shapeColor.cardColor,
    brightness: _schema.brightness,
    inputDecorationTheme: InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: _schema.statusColor.fail),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: _schema.statusColor.fail),
      ),
      border: InputBorder.none,
      fillColor: _schema.shapeColor.navBar.withValues(alpha: .5),
      filled: true,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 57.0, // up from 57
        fontWeight: FontWeight.w400,
        letterSpacing: -0.5,
        color: _schema.textColor.title,
      ),
      displayMedium: TextStyle(
        fontSize: 45.0, // up from 45
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: _schema.textColor.title,
      ),
      displaySmall: TextStyle(
        fontSize: 36.0, // up from 36
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: _schema.textColor.description,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.0, // up from 32
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: _schema.textColor.title,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.0, // up from 28
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: _schema.textColor.title,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.0, // up from 24
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: _schema.textColor.title,
      ),
      titleLarge: TextStyle(
        fontSize: 22.0, // up from 22
        fontWeight: FontWeight.w500,
        letterSpacing: 0.0,
        color: _schema.textColor.title,
      ),
      titleMedium: TextStyle(
        fontSize: 16.0, // up from 16
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: _schema.textColor.title,
      ),
      titleSmall: TextStyle(
        fontSize: 14.0, // up from 14
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: _schema.textColor.title,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0, // up from 16
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: _schema.textColor.description,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0, // up from 14
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: _schema.textColor.description,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0, // up from 12
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: _schema.textColor.description,
      ),
      labelLarge: TextStyle(
        fontSize: 14.0, // up from 14
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: _schema.textColor.title,
      ),
      labelMedium: TextStyle(
        fontSize: 12.0, // up from 12
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: _schema.textColor.title,
      ),
      labelSmall: TextStyle(
        fontSize: 11.0, // up from 11
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: _schema.textColor.title,
      ),

    ),
    dividerColor: _schema.shapeColor.borderColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: _schema.textColor.title,
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _schema.shapeColor.backgroundColor,
      selectedItemColor: _schema.primaryColor,
    ),
    iconTheme: IconThemeData(color: _schema.shapeColor.iconColor.selected),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _schema.primaryColor,
        foregroundColor: _schema.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        textStyle: TextStyle(fontFamily: fontFamily, fontSize: 16),
      ),
    ),
  );
}

AppColorsSchema getSchema() {
  return MainColorSchema();
}

extension ThemeUtils on ThemeData {
  AppColorsSchema get appSchema {
    return getSchema();
  }
}
