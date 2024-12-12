import 'package:flutter/material.dart';
import 'package:hurdl_chat/common/theme/color.dart';
import 'package:hurdl_chat/common/theme/customtext.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox.expand(
        child: Center(
          child: Customtext(
            title: "Profile View",
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
