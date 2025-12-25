// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Cairo-Black.ttf
  String get cairoBlack => 'assets/fonts/Cairo-Black.ttf';

  /// File path: assets/fonts/Cairo-Bold.ttf
  String get cairoBold => 'assets/fonts/Cairo-Bold.ttf';

  /// File path: assets/fonts/Cairo-ExtraBold.ttf
  String get cairoExtraBold => 'assets/fonts/Cairo-ExtraBold.ttf';

  /// File path: assets/fonts/Cairo-ExtraLight.ttf
  String get cairoExtraLight => 'assets/fonts/Cairo-ExtraLight.ttf';

  /// File path: assets/fonts/Cairo-Light.ttf
  String get cairoLight => 'assets/fonts/Cairo-Light.ttf';

  /// File path: assets/fonts/Cairo-Medium.ttf
  String get cairoMedium => 'assets/fonts/Cairo-Medium.ttf';

  /// File path: assets/fonts/Cairo-Regular.ttf
  String get cairoRegular => 'assets/fonts/Cairo-Regular.ttf';

  /// File path: assets/fonts/Cairo-SemiBold.ttf
  String get cairoSemiBold => 'assets/fonts/Cairo-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    cairoBlack,
    cairoBold,
    cairoExtraBold,
    cairoExtraLight,
    cairoLight,
    cairoMedium,
    cairoRegular,
    cairoSemiBold,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icons/back.svg');

  /// File path: assets/icons/fav.svg
  SvgGenImage get fav => const SvgGenImage('assets/icons/fav.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/map.svg
  SvgGenImage get map => const SvgGenImage('assets/icons/map.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/sections.svg
  SvgGenImage get sections => const SvgGenImage('assets/icons/sections.svg');

  /// File path: assets/icons/settings.svg
  SvgGenImage get settings => const SvgGenImage('assets/icons/settings.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    back,
    fav,
    home,
    map,
    search,
    sections,
    settings,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
