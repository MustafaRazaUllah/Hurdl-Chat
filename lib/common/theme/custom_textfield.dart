import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hurdl_chat/common/theme/color.dart';
import 'package:hurdl_chat/common/theme/customtext.dart';

class CustomTextfield extends StatefulWidget {
  final String hinttext;
  final String lable;
  final TextEditingController controller;
  final bool isPassword;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hinttext,
    this.isPassword = false,
    this.lable = "",
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.lable.isNotEmpty) ...[
          Customtext(
            title: widget.lable,
            fontSize: 16,
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 10),
        ],
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _isObscure : false,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
          decoration: InputDecoration(
            fillColor: AppColors.textfieldColor,
            filled: true,
            hintText: widget.hinttext,
            hintStyle: GoogleFonts.poppins(
              color: AppColors.white.withOpacity(0.4),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.white.withOpacity(0.4),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
