import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/auth/view/login_view.dart';
import 'package:hurdl_chat/common/theme/color.dart';
import 'package:hurdl_chat/common/theme/customtext.dart';
import 'package:hurdl_chat/db%20and%20cache/cache.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          IconButton(
            onPressed: () async {
              await CacheHandle.logout();
              Get.offAll(() => LoginView());
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: const SizedBox.expand(
        child: Center(
          child: Customtext(
            title: "Home View",
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
