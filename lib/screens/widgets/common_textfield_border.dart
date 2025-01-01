import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management/core/color/color.dart';

class CommonTextFieldBorder extends StatelessWidget {
  final String? hintText;
  final String? headerLabel;
  final EdgeInsetsGeometry? contentPadding;
  final Color? hintTextColor;
  final FontWeight? hintTextFontWeight;
  final double? hintTextFontSize;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? borderColor;
  final TextInputType? keyBoardType;
  final TextEditingController? con;
  final bool? readOnly;
  final void Function()? onTap;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLine;
  final bool? isDense;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;

  const CommonTextFieldBorder({
    Key? key,
    this.hintText,
    this.headerLabel,
    this.contentPadding,
    this.hintTextColor,
    this.hintTextFontWeight,
    this.hintTextFontSize,
    this.fillColor,
    this.borderColor,
    this.keyBoardType,
    this.con,
    this.validator,
    this.readOnly,
    this.onTap,
    this.prefix,
    this.isDense,
    this.suffix,
    this.inputFormatters,
    this.maxLine,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine ?? 1,
      controller: con,
      keyboardType: keyBoardType,
      validator: validator,
      readOnly: readOnly ?? false,
      onTap: onTap,
      enabled: true,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        filled: true,
        isDense: isDense ?? false,
        hintText: hintText,
        contentPadding: contentPadding,
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintStyle: TextStyle(
          color: hintTextColor ?? AppColor.textColor,
          fontWeight: hintTextFontWeight ?? FontWeight.w500,
          fontSize: hintTextFontSize ?? 14,
        ),
        fillColor: fillColor ?? AppColor.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: borderColor ?? AppColor.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: borderColor ?? AppColor.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: borderColor ?? AppColor.white,
          ),
        ),
      ),
    );
  }
}
