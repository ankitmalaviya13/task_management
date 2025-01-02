import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management/core/color/color.dart';

class CommonTextField extends StatelessWidget {
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
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool? borderOutline;
  final bool? isDense;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;

  const CommonTextField({
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
    this.suffix,
    this.inputFormatters,
    this.maxLine,
    this.obscureText,
    this.borderOutline,
    this.isDense,
    this.onEditingComplete,
    this.onChanged,
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
      cursorColor: AppColor.black,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        isDense: isDense ?? false,
        hintText: hintText,
        contentPadding: contentPadding,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: prefix,
        ),
        prefixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 20),
        suffixIcon: suffix,
        hintStyle: TextStyle(
          color: hintTextColor ?? AppColor.greyText,
          fontWeight: hintTextFontWeight ?? FontWeight.w400,
          fontSize: hintTextFontSize ?? 14,
        ),
        fillColor: fillColor ?? AppColor.bgColor,
        border: borderOutline ?? false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: borderColor ?? AppColor.borderColor,
                ),
              )
            : null,
        disabledBorder: borderOutline ?? false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: borderColor ?? AppColor.borderColor,
                ),
              )
            : null,
        enabledBorder: borderOutline ?? false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: borderColor ?? AppColor.borderColor,
                ),
              )
            : UnderlineInputBorder(borderSide: BorderSide(color: borderColor ?? AppColor.darkGrey)),
        focusedBorder: borderOutline ?? false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: borderColor ?? AppColor.borderColor,
                ),
              )
            : const UnderlineInputBorder(borderSide: BorderSide(color: AppColor.black)),
      ),
    );
  }
}
