import 'package:flutter/material.dart';

part 'colors.dart';

abstract class AppColorsSchema {
  MainColor get primaryColor => metallicSeaweed;

  MainColor metallicSeaweed = MainColor(0xff017F8A);
  MainColor graniteGrey = MainColor(0xff616364);
  MainColor red = MainColor(Colors.red.toARGB32());
  MainColor green = MainColor(Colors.green.toARGB32());
  MainColor gold = MainColor(0xffF6D763);
  MainColor white = MainColor(0xffffffff);
  MainColor darkJungleGreen = MainColor(0xff091F22);
  MainColor japaneseIndigo = MainColor(0xff213E41);
  MainColor jetStream = MainColor(0xffBCCECF);

  TextColors get textColor;

  ShapeColors get shapeColor;

  StatusColors get statusColor;

  Brightness get brightness;
}

class MainColorSchema extends AppColorsSchema {
  @override
  Brightness get brightness => Brightness.light;
  @override
  TextColors get textColor => TextColors(title: white, description: jetStream);

  @override
  ShapeColors get shapeColor => ShapeColors(
    cardColor: darkJungleGreen,
    backgroundColor: darkJungleGreen,
    borderColor: jetStream,
    navBar: darkJungleGreen,
    iconColor: white,
    secondaryButton: graniteGrey,
  );

  @override
  StatusColors get statusColor => StatusColors(fail: red, success: green);
}
