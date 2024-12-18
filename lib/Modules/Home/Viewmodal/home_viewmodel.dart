import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/Home/model/chatmodel.dart';
import 'package:hurdl_chat/Modules/Home/service/home_service.dart';

class HomeViewModel extends GetxController with HomeService {
  RxList<ChatModel> allChats = <ChatModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> onGetAllChats({
    required String currentUserID,
  }) async {
    // try {
      isLoading.value = true;
      allChats.value = await getAllChats(
        currentUserID: currentUserID,
      );
      isLoading.value = false;
      allChats.refresh();
    // } catch (e) {
    //   isLoading.value = false;
    //   print("onGetAllChats Error: $e");
    // }
  }
}
