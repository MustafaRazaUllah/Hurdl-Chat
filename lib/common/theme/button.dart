import 'package:flutter/material.dart';
import 'color.dart';
import 'customtext.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final double? fontSize;
  final Color? textColor;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final double? height;
  final double? width;

  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.fontSize,
    this.textColor,
    this.buttonColor,
    this.buttonBorderColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: buttonBorderColor ?? AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Customtext(
            title: title,
            fontSize: fontSize,
            color: textColor ?? AppColors.black,
          ),
        ),
      ),
    );
  }
}
