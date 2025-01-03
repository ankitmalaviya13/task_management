import 'package:flutter/material.dart';

import '../../core/color/color.dart';
import '../../core/screen_size/screen_size.dart';

customIndicator() {
  return Container(
    height: ScreenSize.height,
    width: ScreenSize.width,
    color: Colors.transparent,
    child: const Center(
      child: CircularProgressIndicator(
        color: AppColor.black,
      ),
    ),
  );
}

customIndicatorMore() {
  return const Center(
    child: CircularProgressIndicator(
      color: AppColor.black,
    ),
  );
}
