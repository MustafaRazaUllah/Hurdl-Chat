import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/profile/model/usermodel.dart';
import 'package:hurdl_chat/Modules/profile/service/profile_service.dart';
import 'package:hurdl_chat/db%20and%20cache/cache.dart';

class ProfileViewmodel extends GetxController with ProfileService {
  Rx<UserModel> userData = UserModel.fromEmpty().obs;

  Future<void> getProfile() async {
    String userID = await CacheHandle.getUID();
    print("userID111 $userID");
    userData.value = await fetchUserDataService(userID: userID);
    userData.refresh();
  }
}
