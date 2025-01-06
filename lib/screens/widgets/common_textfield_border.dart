import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management/core/color/color.dart';

class CommonTextFieldBorder extends StatefulWidget {
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
  State<CommonTextFieldBorder> createState() => _CommonTextFieldBorderState();
}

class _CommonTextFieldBorderState extends State<CommonTextFieldBorder> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine ?? 1,
      controller: widget.con,
      keyboardType: widget.keyBoardType,
      validator: widget.validator,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      enabled: true,
      obscureText: widget.obscureText ?? false,
      inputFormatters: widget.inputFormatters,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        filled: true,
        isDense: widget.isDense ?? false,
        hintText: widget.hintText,
        contentPadding: widget.contentPadding,
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        hintStyle: TextStyle(
          color: widget.hintTextColor ?? AppColor.textColor,
          fontWeight: widget.hintTextFontWeight ?? FontWeight.w500,
          fontSize: widget.hintTextFontSize ?? 14,
        ),
        fillColor: widget.fillColor ?? AppColor.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: widget.borderColor ?? AppColor.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: widget.borderColor ?? AppColor.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColor.white,
          ),
        ),
      ),
    );
  }
}
