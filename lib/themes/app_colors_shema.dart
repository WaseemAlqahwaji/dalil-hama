// import 'package:flutter/material.dart';
//
// part 'colors.dart';
//
// abstract class AppColorsSchema {
//   MainColor get primaryColor => polishedPine;
//
//   Brightness get brightness;
//
//   TextColors get textColors;
//
//   ShapeColors get shapeColors;
//
//   StatusColors get statusColors => StatusColors(
//     fail: englishVermilion,
//     success: middleGreen,
//     done: outerSpace,
//     pending: middleGreen,
//   );
//
//   AppPadding get appPadding =>
//       AppPadding(mainPagePadding: EdgeInsets.symmetric(horizontal: 16));
//
//   Shadows get shadows;
//
//   MainColor white = MainColor(0xffffffff);
//   Color grey = Colors.grey;
//   Color black = Colors.black;
//   MainColor blue = MainColor(Colors.blue.toARGB32());
//   MainColor polishedPine = MainColor(
//     0xff61B892,
//     swatch: {ColorType.shade5: Color(0xff34BB8F)},
//   );
//   MainColor cultured = MainColor(
//     0xffF7F7F7,
//     swatch: {ColorType.shade5: Color(0xffF6F6F6)},
//   );
//   MainColor tigerEye = MainColor(0xffE5A03A);
//   MainColor middleGreen = MainColor(0xff4AA35A);
//   MainColor englishVermilion = MainColor(0xffD14A3D);
//   MainColor outerSpace = MainColor(0xff2A3B32);
//   MainColor smokyBlack = MainColor(0xff0C0C0C);
//   MainColor dolphinGray = MainColor(0xff818C8D);
//   MainColor silverFoil = MainColor(0xffB0B0B0);
//   MainColor darkLiver = MainColor(0xff4F4F4F);
//   MainColor silverLand = MainColor(0xffBDC3C7);
//   MainColor grayX11 = MainColor(0xffBDBDBD);
//   MainColor cadetGray = MainColor(0xff90A4AE);
//   MainColor gunMental = MainColor(0xff263238);
//   MainColor quickSilver = MainColor(0xffA3A3A3);
//   MainColor silverSand = MainColor(0xffBEC3C7);
//   MainColor darkCharcoal = MainColor(0xff333333);
//   MainColor philipineSilver = MainColor(0xffB3B3B3);
//   MainColor chineseWhite = MainColor(0xffE4E4DE);
//   MainColor oldSilver = MainColor(0xff858585);
//   MainColor lynxWhite = MainColor(0xffF7F7F7);
//   MainColor persianRed = MainColor(0xffD32F2F);
//   MainColor mintGreen = MainColor(0xffE8F5E9);
//   MainColor antiFlashWhite = MainColor(0xffF0F0F0);
//   MainColor silver = MainColor(0xffBDC3C7);
//   MainColor gamboge = MainColor(0xffF39C12);
//   MainColor red = MainColor(0xffE53935);
//   MainColor brightGray = MainColor(0xffEAEAEB);
//
//   MainColor gray = MainColor(0xff7D7D7D);
//   MainColor metallicSilver = MainColor(0xff9FA8B2);
//   MainColor blackCoral = MainColor(0xff5A5F63);
//   MainColor charlestonGreen = MainColor(0xff2C2C2C);
//   MainColor pineTree = MainColor(0xff2A2A28);
//   MainColor eireBlack = MainColor(0xff1C1C1C);
//   MainColor chineseSilver = MainColor(0xffC8C8C8);
//   MainColor blackOlive = MainColor(0xff3A3A3A);
//   MainColor uGold = MainColor(0xffC4891A);
//   MainColor smoky = MainColor(0xff0D0D0D);
//   MainColor eBlack = MainColor(0xff121212);
//   // MainColor cultured = MainColor(0xff5A5F63);
//
//   // MainColor graniteGrey = MainColor(0xff666666);
// }
//
// class LightAppColorSchema extends AppColorsSchema {
//   @override
//   Brightness get brightness => Brightness.light;
//
//   @override
//   TextColors get textColors => TextColors(
//     // persianRed: persianRed,
//     placeHolder: silverFoil,
//     caption: cadetGray,
//     textLightH2: black,
//     textDarkH1Body: outerSpace,
//     unSelectedText: silverSand,
//     appBarTitle: darkCharcoal,
//   );
//
//   @override
//   ShapeColors get shapeColors => ShapeColors(
//     backgroundColor: white,
//     dividerColor: philipineSilver,
//     cardColor: cultured,
//     borderColor: chineseWhite,
//     appBar: white,
//     navBar: white,
//     iconColor: dolphinGray,
//     disabledBackgroundColor: silverLand,
//     starColor: gamboge,
//   );
//
//   @override
//   Shadows get shadows => Shadows(
//     mainShadow: [
//       BoxShadow(
//         color: black.withValues(alpha: 0.1),
//         spreadRadius: 0,
//         blurRadius: 10,
//       ),
//     ],
//   );
// }
//
// class DarkAppColorSchema extends AppColorsSchema {
//   @override
//   Brightness get brightness => Brightness.dark;
//
//   @override
//   ShapeColors get shapeColors => ShapeColors(
//     backgroundColor: smoky,
//     dividerColor: charlestonGreen,
//     cardColor: eBlack,
//     borderColor: pineTree,
//     appBar: eireBlack,
//     navBar: eireBlack,
//     iconColor: chineseSilver,
//     disabledBackgroundColor: blackOlive,
//     starColor: uGold,
//   );
//
//   @override
//   TextColors get textColors => TextColors(
//     appBarTitle: cultured,
//     caption: metallicSilver,
//     placeHolder: gray,
//     textDarkH1Body: Colors.white,
//     textLightH2: Colors.white,
//     unSelectedText: blackCoral,
//   );
//
//   @override
//   Shadows get shadows =>
//       Shadows(mainShadow: [BoxShadow(color: Colors.transparent)]);
// }
