import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hurdl_chat/Modules/Home/model/chatmodel.dart';

mixin HomeService {
  final _firestore = FirebaseFirestore.instance;
  Future<List<ChatModel>> getAllChats({
    required String currentUserID,
  }) async {
    // try {
      // Query to fetch chats where the currentUserID exists in participantsIDs array
      final query = await _firestore
          .collection('chats')
          .where('participantsIDs', arrayContains: currentUserID)
          .get();

      // Map the data into a list of ChatModel
      return query.docs
          .map((doc) =>
              ChatModel.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    // } catch (e) {
    //   // Handle any errors
    //   print('Error fetching chats: $e');
    //   return [];
    // }
  }
}
