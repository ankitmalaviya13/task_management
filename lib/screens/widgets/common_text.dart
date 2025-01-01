import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? decorationColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxlines;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final bool? sofetwrap;

  const CommonText(
      {super.key,
      this.text,
      this.decorationColor,
      this.maxlines,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.textDecoration,
      this.sofetwrap,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: maxlines,
      style: TextStyle(
          color: color ?? Colors.black,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: decorationColor,
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          overflow: overflow),
      softWrap: sofetwrap,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
