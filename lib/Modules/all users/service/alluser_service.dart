import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hurdl_chat/Modules/profile/model/usermodel.dart';

mixin AlluserService {
// Firebase forestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> fetchAllUsersService() async {
    List<UserModel> result = [];
    try {
      // Fetch all users from the server
      await _firestore.collection("users").get().then((value) {
        for (var element in value.docs) {
          result.add(UserModel.fromFirestore(element.data()));
        }
      });
    } catch (e) {
      print("fetchAllUsersService $e");
    }
    return result;
  }
}
