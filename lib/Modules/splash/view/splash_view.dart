import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/Home/View/home_view.dart';
import 'package:hurdl_chat/Modules/auth/view/signup_view.dart';
import 'package:hurdl_chat/db%20and%20cache/cache.dart';
import '../../auth/view/login_view.dart';
import '../../../common/theme/assets.dart';
import '../../../common/theme/button.dart';
import '../../../common/theme/color.dart';
import '../../../common/theme/customtext.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isShowingButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      checkUser();
    });
  }

  void checkUser() async {
    String userID = await CacheHandle.getUID();

    if (userID.isNotEmpty) {
      Get.offAll(() => const HomeView());
    } else {
      setState(() {
        isShowingButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox.expand(
          child: Column(
        children: [
          const Spacer(),
          Image.asset(
            AppAssets.logo,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          const Spacer(),
          Visibility(
            visible: isShowingButton,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppButton(
                    title: "Sign Up",
                    onPressed: () {
                      Get.to(() => SignupView());
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Customtext(
                        title: "Already have an account?",
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAll(() =>  LoginView());
                        },
                        child: const Customtext(
                          title: "Login",
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
