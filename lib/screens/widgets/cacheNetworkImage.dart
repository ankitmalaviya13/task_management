import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';

Container cachedNetworkImage({
  height,
  width,
  fit,
  image,
  circular,
  placeholder,
  customIndicatiorFlag = 0,
  clipRRectBorderRadius,
}) {
  return Container(
    height: height,
    width: width,
    child: ClipRRect(
      borderRadius: clipRRectBorderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        cacheKey: image,
        width: width,
        height: height,
        fit: fit,
        imageUrl: image ?? '',
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            child: /* image != null
                ? Center(
                    child: customIndicator(),
                  )
                :*/
                Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(circular),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(placeholder ?? ""),
                ),
              ),
            ),
            decoration: BoxDecoration(
              // color: Colors.transparent,
              borderRadius: BorderRadius.circular(circular),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(circular),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(placeholder ?? ""),
            ),
          ),
        ),
      ),
    ),
  );
}

Future deleteImageFromCache() async {
  await DefaultCacheManager().emptyCache();

  // await CachedNetworkImage.evictFromCache(url);
}