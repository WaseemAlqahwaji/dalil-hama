// import 'package:core_package/core_package.dart';
// import 'package:flutter/material.dart';
//
// class AppTheme {
//   final AppColorsSchema _schema;
//
//   AppTheme(this._schema);
//
//   ThemeData getThemeData({
//     String? fontFamily,
//     String? headLineFont,
//   }) => ThemeData(
//     // primaryColor: _schema.primaryColor,
//     // dividerColor: _schema.shapeColors.dividerColor,
//     // brightness: _schema.brightness,
//     // useMaterial3: true,
//     // fontFamily: fontFamily,
//     // iconTheme: IconThemeData(color: _schema.shapeColors.iconColor),
//     // cardColor: _schema.shapeColors.cardColor,
//     // scaffoldBackgroundColor: _schema.shapeColors.backgroundColor,
//     // appBarTheme: AppBarTheme(
//     //   backgroundColor: _schema.shapeColors.backgroundColor,
//     //   titleTextStyle: TextStyle(
//     //     fontSize: 22,
//     //     fontFamily: headLineFont,
//     //     color: _schema.textColors.title,
//     //   ),
//     //   toolbarHeight: 70,
//     // ),
//     // actionIconTheme: ActionIconThemeData(
//     //   backButtonIconBuilder: (context) =>
//     //       Icon(Icons.arrow_back_ios_new, color: _schema.shapeColors.iconColor),
//     // ),
//     // cardTheme: CardThemeData(color: _schema.shapeColors.cardColor),
//     // colorScheme: ColorScheme.fromSeed(
//     //   seedColor: _schema.primaryColor,
//     //   surface: _schema.shapeColors.backgroundColor,
//     //   onSurface: _schema.textColors.title,
//     // ),
//     // tabBarTheme: TabBarThemeData(
//     //   tabAlignment: TabAlignment.start,
//     //   dividerColor: _schema.shapeColors.dividerColor,
//     // ),
//     // bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     //   backgroundColor: _schema.shapeColors.backgroundColor,
//     //   type: BottomNavigationBarType.fixed,
//     //
//     //   unselectedLabelStyle: TextStyle(color: _schema.shapeColors.unActiveIcon),
//     //   unselectedIconTheme: IconThemeData(
//     //     color: _schema.shapeColors.unActiveIcon,
//     //   ),
//     //   unselectedItemColor: _schema.shapeColors.unActiveIcon,
//     //   selectedLabelStyle: TextStyle(color: _schema.textColors.title),
//     //   selectedItemColor: _schema.textColors.title,
//     //   elevation: 0,
//     //   selectedIconTheme: IconThemeData(color: _schema.textColors.title),
//     // ),
//     // textTheme: TextTheme(
//     //   headlineLarge: TextStyle(
//     //     fontSize: 28,
//     //     fontWeight: FontWeight.w500,
//     //     color: _schema.textColors.title,
//     //     fontFamily: headLineFont ?? fontFamily,
//     //   ),
//     //   headlineMedium: TextStyle(
//     //     fontSize: 20,
//     //     color: _schema.textColors.title,
//     //     fontWeight: FontWeight.w500,
//     //     fontFamily: headLineFont ?? fontFamily,
//     //   ),
//     //   headlineSmall: TextStyle(
//     //     fontSize: 18,
//     //     color: _schema.textColors.title,
//     //     fontWeight: FontWeight.w500,
//     //     fontFamily: headLineFont ?? fontFamily,
//     //   ),
//     //   titleLarge: TextStyle(
//     //     fontSize: 18,
//     //     fontWeight: FontWeight.w600,
//     //     color: _schema.textColors.title,
//     //     fontFamily: fontFamily,
//     //   ),
//     //   titleMedium: TextStyle(
//     //     fontSize: 16,
//     //     fontWeight: FontWeight.w600,
//     //     color: _schema.textColors.title,
//     //     fontFamily: fontFamily,
//     //   ),
//     //   titleSmall: TextStyle(
//     //     fontSize: 14,
//     //     fontWeight: FontWeight.w600,
//     //     color: _schema.textColors.title,
//     //     fontFamily: fontFamily,
//     //   ),
//     //   labelLarge: TextStyle(
//     //     fontSize: 16,
//     //     fontWeight: FontWeight.w600,
//     //     color: _schema.textColors.title,
//     //     fontFamily: fontFamily,
//     //   ),
//     //   labelMedium: TextStyle(
//     //     fontSize: 13,
//     //     fontWeight: FontWeight.w600,
//     //     fontFamily: fontFamily,
//     //     color: _schema.textColors.body,
//     //   ),
//     //   labelSmall: TextStyle(
//     //     fontSize: 12,
//     //     fontWeight: FontWeight.w600,
//     //     fontFamily: fontFamily,
//     //     color: _schema.textColors.body,
//     //   ),
//     //   bodyLarge: TextStyle(
//     //     fontSize: 16,
//     //     color: _schema.textColors.title,
//     //     fontWeight: FontWeight.w600,
//     //   ),
//     //   bodyMedium: TextStyle(
//     //     fontSize: 16,
//     //     color: _schema.textColors.body,
//     //     fontWeight: FontWeight.w600,
//     //   ),
//     //   bodySmall: TextStyle(
//     //     fontSize: 14,
//     //     color: _schema.textColors.body,
//     //     fontWeight: FontWeight.w600,
//     //   ),
//     //   displayLarge: TextStyle(color: _schema.textColors.title),
//     //   displayMedium: TextStyle(color: _schema.textColors.title),
//     //   displaySmall: TextStyle(color: _schema.textColors.title),
//     // ),
//     // listTileTheme: ListTileThemeData(
//     //   titleTextStyle: TextStyle(
//     //     color: _schema.textColors.title,
//     //     fontFamily: fontFamily,
//     //     fontSize: 18,
//     //     fontWeight: FontWeight.w500,
//     //   ),
//     // ),
//     // disabledColor: _schema.textColors.title,
//     //
//     // inputDecorationTheme: InputDecorationThemeData(
//     //   labelStyle: TextStyle(color: _schema.textColors.title),
//     //   prefixStyle: TextStyle(color: _schema.textColors.title),
//     //   suffixStyle: TextStyle(color: _schema.textColors.title),
//     //
//     //   enabledBorder: OutlineInputBorder(
//     //     borderRadius: BorderRadius.circular(50),
//     //     borderSide: BorderSide(color: _schema.brightGray),
//     //   ),
//     //   disabledBorder: OutlineInputBorder(
//     //     borderRadius: BorderRadius.circular(50),
//     //     borderSide: BorderSide(color: _schema.brightGray),
//     //   ),
//     //   focusedBorder: OutlineInputBorder(
//     //     borderRadius: BorderRadius.circular(50),
//     //     borderSide: BorderSide(color: _schema.primaryColor),
//     //   ),
//     //   border: OutlineInputBorder(
//     //     borderRadius: BorderRadius.circular(50),
//     //     borderSide: BorderSide(color: _schema.brightGray),
//     //   ),
//     //   errorBorder: OutlineInputBorder(
//     //     borderRadius: BorderRadius.circular(50),
//     //     borderSide: BorderSide(color: _schema.statusColors.fail),
//     //   ),
//     // ),
//     // elevatedButtonTheme: ElevatedButtonThemeData(
//     //   style: ElevatedButton.styleFrom(
//     //     backgroundColor: _schema.primaryColor,
//     //     padding: EdgeInsets.all(16),
//     //     textStyle: TextStyle(
//     //       color: _schema.white,
//     //       fontFamily: fontFamily,
//     //       fontWeight: FontWeight.w500,
//     //       fontSize: 16,
//     //     ),
//     //     foregroundColor: _schema.white,
//     //   ),
//     // ),
//     // outlinedButtonTheme: OutlinedButtonThemeData(
//     //   style: OutlinedButton.styleFrom(
//     //     padding: EdgeInsets.all(16),
//     //     textStyle: TextStyle(
//     //       color: _schema.textColors.title,
//     //       fontFamily: fontFamily,
//     //       fontWeight: FontWeight.w600,
//     //     ),
//     //     foregroundColor: _schema.textColors.title,
//     //   ),
//     // ),
//     // dialogTheme: DialogThemeData(
//     //   titleTextStyle: TextStyle(
//     //     fontSize: 20,
//     //     color: _schema.textColors.title,
//     //     fontWeight: FontWeight.w500,
//     //     fontFamily: headLineFont ?? fontFamily,
//     //   ),
//     // ),
//     // textSelectionTheme: TextSelectionThemeData(
//     //   selectionHandleColor: _schema.primaryColor,
//     //   cursorColor: _schema.primaryColor,
//     //   selectionColor: _schema.primaryColor.withValues(alpha: 0.4),
//     // ),
//     // expansionTileTheme: ExpansionTileThemeData(
//     //   textColor: _schema.textColors.title,
//     //
//     //   expandedAlignment: AlignmentDirectional.topStart,
//     //   collapsedTextColor: _schema.textColors.title,
//     //   collapsedShape: RoundedRectangleBorder(
//     //     borderRadius: BorderRadius.circular(8),
//     //     side: BorderSide(color: _schema.shapeColors.borderColor),
//     //   ),
//     //   shape: RoundedRectangleBorder(
//     //     borderRadius: BorderRadius.circular(8),
//     //     side: BorderSide(color: _schema.shapeColors.borderColor),
//     //   ),
//     //
//     //   childrenPadding: EdgeInsetsGeometry.all(16),
//     // ),
//   );
// }
//
// extension ContextAppThemeExtension on BuildContext {
//   AppColorsSchema get appColor {
//     return LightAppColorSchema();
//   }
//
//   ThemeData theme({String? fontFamily, String? headLineFont}) => AppTheme(
//     appColor,
//   ).getThemeData(fontFamily: fontFamily, headLineFont: headLineFont);
//
//   TextTheme get textTheme => Theme.of(this).textTheme;
// }
//
// extension ThemeUtils on ThemeData {
//   AppColorsSchema get appColors {
//     return LightAppColorSchema();
//   }
// }
