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
  MainColor teal = MainColor(0xff017f81);
  MainColor lighTeal = MainColor(0xff12A5B3);

  TextColors get textColor;

  ShapeColors get shapeColor;

  StatusColors get statusColor;

  Brightness get brightness;

  ScaffolGradientBackgroundColor get scaffolGradientBackgroundColor;
}

class MainColorSchema extends AppColorsSchema {
  @override
  Brightness get brightness => Brightness.dark;
  @override
  TextColors get textColor => TextColors(title: white, description: jetStream);

  @override
  ShapeColors get shapeColor => ShapeColors(
    cardColor: darkJungleGreen,
    backgroundColor: darkJungleGreen,
    borderColor: jetStream,
    navBar: darkJungleGreen,
    iconColor: IconColor(selected: white, unSelected: jetStream),
    secondaryButton: graniteGrey,
  );

  @override
  StatusColors get statusColor => StatusColors(fail: red, success: green);

  @override
  ScaffolGradientBackgroundColor get scaffolGradientBackgroundColor =>
      ScaffolGradientBackgroundColor(
        backgroundColor: darkJungleGreen,
        topRadialColor: teal,
        bottomRadialColor: lighTeal,
      );
}
