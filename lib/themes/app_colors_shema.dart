import 'package:flutter/material.dart';

part 'colors.dart';

abstract class AppColorsSchema {
  MainColor get primaryColor => metallicSeaweed;

  MainColor metallicSeaweed = MainColor(0xff193F44);
  MainColor graniteGrey = MainColor(0xff616364);
  MainColor red = MainColor(Colors.red.toARGB32());
  MainColor green = MainColor(Colors.green.toARGB32());
  MainColor gold = MainColor(0xffF6D763);
  MainColor white = MainColor(0xffffffff);
  MainColor darkJungleGreen = MainColor(0xff0B2225);
  MainColor japaneseIndigo = MainColor(0xff213E41);
  MainColor jetStream = MainColor(0xffBCCECF);
  MainColor teal = MainColor(0xff017f81);
  MainColor lightTeal = MainColor(0xff12A5B3);
  MainColor drainTree = MainColor(0xff012426);
  MainColor holly = MainColor(0xff001718);

  TextColors get textColor;

  ShapeColors get shapeColor;

  StatusColors get statusColor;

  Brightness get brightness;

  AppGradients get appGradients;
}

class MainColorSchema extends AppColorsSchema {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  TextColors get textColor => TextColors(title: white, description: jetStream);

  @override
  ShapeColors get shapeColor => ShapeColors(
    cardColor: holly.withValues(alpha: 0.3),
    backgroundColor: darkJungleGreen,
    borderColor: white.withValues(alpha: .1),
    navBar: darkJungleGreen,
    iconColor: IconColor(selected: white, unSelected: jetStream),
    secondaryButton: graniteGrey,
  );

  @override
  StatusColors get statusColor => StatusColors(fail: red, success: green);

  @override
  AppGradients get appGradients => AppGradients(
    scaffoldGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF0C3D49),
        Color(0xFF0A3440),
        Color(0xFF082E39),
        Color(0xFF062830),
      ],
      stops: [0.0, 0.35, 0.7, 1.0],
      tileMode: TileMode.decal,
    ),
  );
}
