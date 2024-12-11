import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/Home/View/home_view.dart';
import 'package:hurdl_chat/Modules/auth/view/signup_view.dart';
import 'package:hurdl_chat/Modules/auth/viewmodel/login_viewmodel.dart';
import 'package:hurdl_chat/common/theme/custom_textfield.dart';
import '../../../common/theme/button.dart';
import '../../../common/theme/color.dart';
import '../../../common/theme/customtext.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewmodel controller = Get.put(LoginViewmodel());

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
                  title: "Welcome back!",
                  fontSize: 32,
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 50),
                AppButton(
                  title: "Login",
                  onPressed: () {
                    controller.onLogin(context);
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
              title: "Don’t have an account?",
            ),
            TextButton(
              onPressed: () {
                Get.to(() => SignupView());
              },
              child: const Customtext(
                title: "Sign Up",
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
