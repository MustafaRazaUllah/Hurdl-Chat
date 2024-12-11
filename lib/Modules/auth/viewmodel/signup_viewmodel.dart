import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/auth/service/auth_service.dart';
import 'package:hurdl_chat/Modules/auth/view/createprofile_view.dart';
import 'package:hurdl_chat/common/theme/custom_toast.dart';
import 'package:hurdl_chat/utils/loader.dart';

class SingupViewModel extends GetxController with AuthService {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  Future<void> onRegisterUser(BuildContext context) async {
    try {
      if (emailController.value.text.isEmpty) {
        CustomtToast.error("Email is required");
        return;
      }
      if (passwordController.value.text !=
          confirmPasswordController.value.text) {
        CustomtToast.error("Password and Confirm Password does not match");
        return;
      }
      showLoadingIndicator(context: context);
      String userID = await registerUser(
        email: emailController.value.text,
        password: passwordController.value.text,
      );
      print("userID1111 $userID");
      hideOpenDialog(context: context);
      if (userID.isNotEmpty) {
        Get.to(() => CreateprofileView(userID: userID));
      }
    } catch (e) {
      hideOpenDialog(context: context);
      print(e.toString());
    }
  }
}
