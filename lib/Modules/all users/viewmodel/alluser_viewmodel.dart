import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/all%20users/service/alluser_service.dart';
import 'package:hurdl_chat/Modules/profile/model/usermodel.dart';

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
}
