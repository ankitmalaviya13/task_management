import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/core/constant/constant.dart';
import 'package:task_management/screens/widgets/common_text.dart';

class CommonButton extends StatelessWidget {
  final String? label;
  final Color? buttonColor;
  final double? height;
  final void Function()? onPressed;
  final double? labelSize;
  final Color? labelColor;
  final FontWeight? labelWeight;
  final double? buttonRadius;
  final String? labelLogo;
  final Color? buttonBorderColor;
  final bool? load;
  final bool? gradient;
  final double? width;
  final Color? buttonColorGrade;

  const CommonButton(
      {Key? key,
      this.label,
      this.buttonColor,
      this.height,
      this.width,
      this.onPressed,
      this.labelSize,
      this.labelColor,
      this.labelWeight,
      this.buttonRadius,
      this.labelLogo,
      this.buttonBorderColor,
      this.load,
      this.gradient,
      this.buttonColorGrade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          gradient: gradient ?? false
              ? LinearGradient(
                  colors: [
                    buttonColorGrade ?? AppColor.primaryColor,
                    buttonColorGrade ?? AppColor.buttonWhite,
                  ],
                )
              : onPressed == null
                  ? LinearGradient(
                      colors: [
                        AppColor.primaryColor.withOpacity(0.5),
                        AppColor.primaryColor.withOpacity(0.5),
                      ],
                    )
                  : const LinearGradient(
                      colors: [
                        AppColor.primaryColor,
                        AppColor.primaryColor,
                      ],
                    ),
          borderRadius: BorderRadius.circular(buttonRadius ?? 4),
          border: Border.all(
            color: buttonBorderColor ?? Colors.transparent,
          ),
        ),
        height: height ?? 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            labelLogo != null ? SvgPicture.asset(labelLogo!) : const SizedBox(),
            labelLogo != null ? const SizedBox(width: 12) : const SizedBox(),
            load ?? false
                ? ProgressView()
                : Flexible(
                    child: CommonText(
                      text: label ?? "",
                      fontSize: labelSize,
                      color: labelColor,
                      fontWeight: labelWeight,
                      textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class CommonButtonColor extends StatelessWidget {
  final String? label;
  final Color? buttonColor;
  final double? height;
  final void Function()? onPressed;
  final double? labelSize;
  final Color? labelColor;
  final FontWeight? labelWeight;
  final double? buttonRadius;
  final String? labelLogo;
  final Color? buttonBorderColor;
  final bool? load;
  final bool? gradient;
  final double? width;
  final Color? buttonColorGrade;

  const CommonButtonColor(
      {Key? key,
      this.label,
      this.buttonColor,
      this.height,
      this.width,
      this.onPressed,
      this.labelSize,
      this.labelColor,
      this.labelWeight,
      this.buttonRadius,
      this.labelLogo,
      this.buttonBorderColor,
      this.load,
      this.gradient,
      this.buttonColorGrade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          // gradient: gradient ?? false
          //     ? LinearGradient(
          //   colors: [
          //     buttonColorGrade ?? AppColor.primaryColor,
          //     buttonColorGrade ?? AppColor.primaryColor,
          //   ],
          // )
          //     : onPressed == null
          //     ? LinearGradient(
          //   colors: [
          //     AppColor.primaryColor.withOpacity(0.6),
          //     AppColor.secondaryColor.withOpacity(0.6),
          //   ],
          // )
          //     : const LinearGradient(
          //   colors: [
          //     AppColor.primaryColor,
          //     AppColor.secondaryColor,
          //   ],
          // ),
          borderRadius: BorderRadius.circular(buttonRadius ?? 15),
          border: Border.all(
            width: 1.0,
            color: buttonBorderColor ?? Colors.transparent,
          ),
        ),
        height: height ?? 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            labelLogo != null ? SvgPicture.asset(labelLogo!) : const SizedBox(),
            labelLogo != null ? const SizedBox(width: 12) : const SizedBox(),
            load ?? false
                ? const CircularProgressIndicator(
                    color: AppColor.primaryColor,
                    strokeWidth: 2,
                  )
                : Flexible(
                    child: CommonText(
                      text: label ?? "",
                      fontSize: labelSize,
                      color: labelColor,
                      fontWeight: labelWeight,
                      textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
