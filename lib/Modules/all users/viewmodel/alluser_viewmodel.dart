import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/all%20users/service/alluser_service.dart';
import 'package:hurdl_chat/Modules/profile/model/usermodel.dart';
import 'package:hurdl_chat/utils/loader.dart';

class AlluserViewmodel extends GetxController with AlluserService {
  RxList<UserModel> allUsers = <UserModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getAllUsers() async {
    try {
      isLoading.value = true;
      allUsers.value = await fetchAllUsersService();
      allUsers.refresh();
      isLoading.value = false;
    } catch (e) {
      print("getAllUsers $e");
      isLoading.value = false;
    }
  }

  Future<void> onInitiateChat({
    required BuildContext context,
    required UserModel currentUser,
    required UserModel otherUser,
  }) async {
    try {
      showLoadingIndicator(context: context);
      String chatID = await initiateChat(
        user1: currentUser,
        user2: otherUser,
      );
      hideOpenDialog(context: context);
      if (chatID.isNotEmpty) {
        print("ChatID $chatID");
        // Go to Chat Screen.
      }
    } catch (e) {
      print("onInitiateChat $e");
      hideOpenDialog(context: context);
    }
  }
}
