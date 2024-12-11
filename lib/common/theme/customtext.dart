import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class Customtext extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const Customtext({
    super.key,
    required this.title,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        color: color ?? AppColors.white,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        decoration: TextDecoration.none,
      ),
    );
  }
}
