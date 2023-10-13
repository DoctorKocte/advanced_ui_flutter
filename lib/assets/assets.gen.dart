/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cake1.png
  AssetGenImage get cake1 => const AssetGenImage('assets/images/cake1.png');

  /// File path: assets/images/cake2.png
  AssetGenImage get cake2 => const AssetGenImage('assets/images/cake2.png');

  /// File path: assets/images/cake3.png
  AssetGenImage get cake3 => const AssetGenImage('assets/images/cake3.png');

  /// File path: assets/images/candy.png
  AssetGenImage get candy => const AssetGenImage('assets/images/candy.png');

  /// File path: assets/images/fillHeart.png
  AssetGenImage get fillHeart => const AssetGenImage('assets/images/fillHeart.png');

  /// File path: assets/images/flower.png
  AssetGenImage get flower => const AssetGenImage('assets/images/flower.png');

  /// File path: assets/images/flowers1.png
  AssetGenImage get flowers1 => const AssetGenImage('assets/images/flowers1.png');

  /// File path: assets/images/flowers2.png
  AssetGenImage get flowers2 => const AssetGenImage('assets/images/flowers2.png');

  /// File path: assets/images/flowers3.png
  AssetGenImage get flowers3 => const AssetGenImage('assets/images/flowers3.png');

  /// File path: assets/images/flowers4.png
  AssetGenImage get flowers4 => const AssetGenImage('assets/images/flowers4.png');

  /// File path: assets/images/heart.png
  AssetGenImage get heart => const AssetGenImage('assets/images/heart.png');

  /// File path: assets/images/holiday1.png
  AssetGenImage get holiday1 => const AssetGenImage('assets/images/holiday1.png');

  /// File path: assets/images/holiday3.png
  AssetGenImage get holiday3 => const AssetGenImage('assets/images/holiday3.png');

  /// File path: assets/images/holiday4.png
  AssetGenImage get holiday4 => const AssetGenImage('assets/images/holiday4.png');

  /// File path: assets/images/holiday5.png
  AssetGenImage get holiday5 => const AssetGenImage('assets/images/holiday5.png');

  /// File path: assets/images/holiday6.png
  AssetGenImage get holiday6 => const AssetGenImage('assets/images/holiday6.png');

  /// File path: assets/images/holiday7.png
  AssetGenImage get holiday7 => const AssetGenImage('assets/images/holiday7.png');

  /// File path: assets/images/search.png
  AssetGenImage get search => const AssetGenImage('assets/images/search.png');

  /// File path: assets/images/settings.png
  AssetGenImage get settings => const AssetGenImage('assets/images/settings.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        cake1,
        cake2,
        cake3,
        candy,
        fillHeart,
        flower,
        flowers1,
        flowers2,
        flowers3,
        flowers4,
        heart,
        holiday1,
        holiday3,
        holiday4,
        holiday5,
        holiday6,
        holiday7,
        search,
        settings
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
