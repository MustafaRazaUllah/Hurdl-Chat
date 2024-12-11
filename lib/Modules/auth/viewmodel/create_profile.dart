import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/Home/View/home_view.dart';
import 'package:hurdl_chat/Modules/auth/service/auth_service.dart';
import 'package:hurdl_chat/common/theme/custom_toast.dart';
import 'package:hurdl_chat/utils/loader.dart';

class CreateProfileViewModel extends GetxController with AuthService {
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> genderController = TextEditingController().obs;

  Future<void> onCreateProfile({
    required String userID,
    required BuildContext context,
  }) async {
    try {
      if (firstNameController.value.text.isEmpty) {
        CustomtToast.error("First Name is required");
        return;
      }
      if (lastNameController.value.text.isEmpty) {
        CustomtToast.error("Last Name is required");
        return;
      }
      if (phoneNumberController.value.text.isEmpty) {
        CustomtToast.error("Phone Number is required");
        return;
      }
      if (addressController.value.text.isEmpty) {
        CustomtToast.error("Address is required");
        return;
      }
      if (genderController.value.text.isEmpty) {
        CustomtToast.error("Gender is required");
        return;
      }

      showLoadingIndicator(context: context);

      bool isUserCreate = await createProfile(
        userID: userID,
        firstName: firstNameController.value.text,
        lastName: lastNameController.value.text,
        phoneNumber: phoneNumberController.value.text,
        address: addressController.value.text,
        gender: genderController.value.text,
      );
      hideOpenDialog(context: context);
      if (isUserCreate) {
        Get.offAll(() => const HomeView());
      }
    } catch (e) {
      hideOpenDialog(context: context);
      print(e.toString());
    }
  }
}
