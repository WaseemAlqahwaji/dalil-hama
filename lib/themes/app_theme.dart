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
      backButtonIconBuilder: (context) =>
          CircleButton(icon: Assets.icons.back.dynamicSVGColor(context)),
    ),
    scaffoldBackgroundColor: _schema.shapeColor.backgroundColor,
    cardColor: _schema.shapeColor.cardColor,
    brightness: _schema.brightness,
    textTheme: TextTheme(),
    dividerColor: _schema.shapeColor.borderColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: _schema.textColor.title,
        fontFamily: fontFamily,
        fontSize: 16,
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
