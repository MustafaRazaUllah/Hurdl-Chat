import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/auth/viewmodel/signup_viewmodel.dart';
import 'package:hurdl_chat/common/theme/custom_textfield.dart';
import '../../../common/theme/button.dart';
import '../../../common/theme/color.dart';
import '../../../common/theme/customtext.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final SingupViewModel controller = Get.put(SingupViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox.expand(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Customtext(
                  title: "Sign up",
                  fontSize: 32,
                ),
                const SizedBox(height: 50),
                CustomTextfield(
                  controller: controller.emailController.value,
                  lable: "Email Address",
                  hinttext: "Enter your email Address.",
                ),
                const SizedBox(height: 20),
                CustomTextfield(
                  controller: controller.passwordController.value,
                  lable: "Password",
                  hinttext: "Enter your password.",
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomTextfield(
                  controller: controller.confirmPasswordController.value,
                  lable: "Confirm Password",
                  hinttext: "Enter your confirmed password.",
                  isPassword: true,
                ),
                const SizedBox(height: 50),
                AppButton(
                  title: "Sign Up",
                  onPressed: () {
                    controller.onRegisterUser(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Customtext(
              title: "I have an account?",
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Customtext(
                title: "Login",
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
