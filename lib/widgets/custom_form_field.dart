import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    this.borderRadius = 10,
    this.activeColor = const Color(0xff356C6B),
    required this.onTap,
    required this.validator,
    required this.onSubmit,
    required this.controller,
    required this.keyboardType,
    this.padding,
    this.prefix,
    this.maxLines = 1,
    this.style,
    this.prefixColor,
    this.suffix,
    this.obscure = false,
    this.leftPadding = 8,
    this.rightPadding = 8,
    this.topPadding = 5,
    this.bottomPadding = 5,
    this.borderWidth = 2,
  });

  final String label;
  final double borderRadius;
  final Color activeColor;
  final void Function() onTap;
  final String? Function(String?) validator;
  final String? Function(String?) onSubmit;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry? padding;
  final Icon? prefix;
  final int? maxLines;
  final TextStyle? style;
  final Color? prefixColor;
  final Widget? suffix;
  final bool obscure;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          leftPadding, topPadding, rightPadding, bottomPadding),
      child: TextFormField(
        style: style,
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        onTap: onTap,
        validator: validator,
        onFieldSubmitted: onSubmit,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffE5E5E5),
          contentPadding: padding,
          suffixIcon: suffix,
          prefixIcon: prefix,
          prefixIconColor: prefixColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: borderWidth,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: borderWidth,
              color: Colors.grey,
            ), // Set the disabled color here
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Color(0xff0356C6B),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: activeColor,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
