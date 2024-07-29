import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.width = double.infinity,
    this.height = 50,
    this.radius = 10,
    this.fontWeight = FontWeight.bold,
    this.backColor = Colors.blue,
    this.textColor = Colors.white,
    this.shadowColor = Colors.grey,
    this.fontSize = 14,
    required this.label,
    required this.function,
  });

  final double width;
  final double height;
  final double radius;
  final  FontWeight fontWeight;
  final  Color? backColor;
  final Color textColor;
  final  Color shadowColor;

  final double fontSize;
  final  String label;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(shadowColor),
          backgroundColor: MaterialStateProperty.all<Color>(backColor!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        onPressed: function,
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
