import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/auth/viewmodel/create_profile.dart';
import 'package:hurdl_chat/common/theme/custom_textfield.dart';
import '../../../common/theme/button.dart';
import '../../../common/theme/color.dart';
import '../../../common/theme/customtext.dart';

class CreateprofileView extends StatelessWidget {
  final String userID;
  CreateprofileView({
    super.key,
    required this.userID,
  });

  final CreateProfileViewModel controller = Get.put(CreateProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox.expand(
        child: Column(
          children: [
            const SizedBox(height: 35),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.primaryColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_rounded,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const Customtext(
                      title: "Let’s get started",
                      fontSize: 32,
                    ),
                    const SizedBox(height: 50),
                    CustomTextfield(
                      controller: controller.firstNameController.value,
                      lable: "First Name",
                      hinttext: "Enter your first name.",
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: controller.lastNameController.value,
                      lable: "Last Name",
                      hinttext: "Enter your last name.",
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: controller.phoneNumberController.value,
                      lable: "Phone Number",
                      hinttext: "Enter your phone number.",
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: controller.addressController.value,
                      lable: "Location",
                      hinttext: "Enter your location.",
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: controller.genderController.value,
                      lable: "Gender",
                      hinttext: "Select your gender.",
                    ),
                    const SizedBox(height: 50),
                    AppButton(
                      title: "Create Profile",
                      onPressed: () {
                        controller.onCreateProfile(
                          userID: userID,
                          context: context,
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
