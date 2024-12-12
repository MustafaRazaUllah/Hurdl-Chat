import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/Home/View/home_view.dart';
import 'package:hurdl_chat/Modules/auth/service/auth_service.dart';
import 'package:hurdl_chat/Modules/root/view/root_view.dart';
import 'package:hurdl_chat/common/theme/custom_toast.dart';
import 'package:hurdl_chat/utils/loader.dart';

class LoginViewmodel extends GetxController with AuthService {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  // onlogin Method
  Future<void> onLogin(BuildContext context) async {
    try {
      if (emailController.value.text.isEmpty) {
        CustomtToast.error("Email is required");
        return;
      }
      if (passwordController.value.text.isEmpty) {
        CustomtToast.error("Password is required");
        return;
      }
      showLoadingIndicator(context: context);
      String userID = await loginUser(
        email: emailController.value.text,
        password: passwordController.value.text,
      );
      hideOpenDialog(context: context);
      if (userID.isNotEmpty) {
        Get.offAll(() => const RootView());
      }
    } catch (e) {
      hideOpenDialog(context: context);
    }
  }
}
