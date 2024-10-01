/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Satoshi-Black.ttf
  String get satoshiBlack => 'assets/fonts/Satoshi-Black.ttf';

  /// File path: assets/fonts/Satoshi-Bold.ttf
  String get satoshiBold => 'assets/fonts/Satoshi-Bold.ttf';

  /// File path: assets/fonts/Satoshi-Light.ttf
  String get satoshiLight => 'assets/fonts/Satoshi-Light.ttf';

  /// File path: assets/fonts/Satoshi-Medium.ttf
  String get satoshiMedium => 'assets/fonts/Satoshi-Medium.ttf';

  /// File path: assets/fonts/Satoshi-Regular.ttf
  String get satoshiRegular => 'assets/fonts/Satoshi-Regular.ttf';

  /// List of all assets
  List<String> get values =>
      [satoshiBlack, satoshiBold, satoshiLight, satoshiMedium, satoshiRegular];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/auth_bg.png
  AssetGenImage get authBg => const AssetGenImage('assets/images/auth_bg.png');

  /// File path: assets/images/choose_mode_bg.png
  AssetGenImage get chooseModeBg =>
      const AssetGenImage('assets/images/choose_mode_bg.png');

  /// File path: assets/images/home_artist.png
  AssetGenImage get homeArtist =>
      const AssetGenImage('assets/images/home_artist.png');

  /// File path: assets/images/intro_bg.png
  AssetGenImage get introBg =>
      const AssetGenImage('assets/images/intro_bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [authBg, chooseModeBg, homeArtist, introBg];
}

class $AssetsVectorsGen {
  const $AssetsVectorsGen();

  /// File path: assets/vectors/bottom_pattern.svg
  SvgGenImage get bottomPattern =>
      const SvgGenImage('assets/vectors/bottom_pattern.svg');

  /// File path: assets/vectors/home_top_card.svg
  SvgGenImage get homeTopCard =>
      const SvgGenImage('assets/vectors/home_top_card.svg');

  /// File path: assets/vectors/moon.svg
  SvgGenImage get moon => const SvgGenImage('assets/vectors/moon.svg');

  /// File path: assets/vectors/spotify_logo.svg
  SvgGenImage get spotifyLogo =>
      const SvgGenImage('assets/vectors/spotify_logo.svg');

  /// File path: assets/vectors/sun.svg
  SvgGenImage get sun => const SvgGenImage('assets/vectors/sun.svg');

  /// File path: assets/vectors/top_pattern.svg
  SvgGenImage get topPattern =>
      const SvgGenImage('assets/vectors/top_pattern.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [bottomPattern, homeTopCard, moon, spotifyLogo, sun, topPattern];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVectorsGen vectors = $AssetsVectorsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

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
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
