import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hurdl_chat/Modules/profile/model/usermodel.dart';

mixin ProfileService {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserModel> fetchUserDataService({required String userID}) async {
    UserModel result = UserModel.fromEmpty();
    try {
      await _firestore.collection("users").doc(userID).get().then((value) {
        print("userID222 ${value.exists}");
        if (value.exists) {
          result =
              UserModel.fromFirestore(value.data() as Map<String, dynamic>);
              print("userID333 ${result.email}");
        }
      });
    } catch (e) {
      print("userID444 ${e}");
      print("fetchUserDataService $e");
    }
    // Fetch user data from the server
    return result;
  }
}
