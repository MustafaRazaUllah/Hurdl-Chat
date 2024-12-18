import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hurdl_chat/Modules/profile/model/usermodel.dart';
import 'package:hurdl_chat/common/theme/custom_toast.dart';

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

  // Create Chat with Users
  Future<String> initiateChat({
    required UserModel user1,
    required UserModel user2,
  }) async {
    if (user1.userID.isEmpty) {
      CustomtToast.error("User1 Not Found");
      return "";
    }

    if (user2.userID.isEmpty) {
      CustomtToast.error("User2 Not Found");
      return "";
    }
    // Query to check existing chat
    final query = await _firestore
        .collection('chats')
        .where('participantsIDs', arrayContains: user1.userID)
        .get();

    for (var doc in query.docs) {
      if (doc.data()['participantsIDs'].contains(user2.userID)) {
        // Chat exists, return chatId
        return doc.id;
      }
    }

    // If chat doesn't exist, create a new one
    final newChat = await _firestore.collection('chats').add({
      'participantsIDs': [user1.userID, user2.userID],
      'participants': [user1.toFirestore(), user2.toFirestore()],
      'lastMessage': "",
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    });

    // Step 2: Update the chat with the generated chatId
    await newChat.update({'chatId': newChat.id});

    return newChat.id; // Return the new chatId
  }
}
