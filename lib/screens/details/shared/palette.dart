import 'dart:developer';
import 'dart:ui';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:blurhash_dart/blurhash_extensions.dart';
import 'package:jellyflut/models/enum/imageType.dart';
import 'package:jellyflut/models/jellyfin/item.dart';
import 'package:jellyflut/services/item/itemImageService.dart';
import 'package:palette_generator/palette_generator.dart';

class Palette {
  static Future<PaletteGenerator> getPaletteFromNetworkImage(
      Item item, ImageType searchType) async {
    final url = ItemImageService.getItemImageUrl(
        item.correctImageId(searchType: searchType),
        item.correctImageTags(searchType: searchType),
        imageBlurHashes: item.imageBlurHashes,
        type: searchType);
    return _generatePalettefromNetworkImage(url);
  }

  static Future<PaletteGenerator> _generatePalettefromNetworkImage(
      String url) async {
    return PaletteGenerator.fromImageProvider(
      NetworkImage(url),
      maximumColorCount: 20,
    ).onError((error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      throw (error.toString());
    });
  }

  static Color generatePalettefromBlurhash(String hash) {
    final blurHash = BlurHash.decode(hash);
    final rgb = blurHash.averageLinearRgb.toRgb();
    return Color.fromRGBO(rgb.r.toInt(), rgb.g.toInt(), rgb.b.toInt(), 1);
  }
}