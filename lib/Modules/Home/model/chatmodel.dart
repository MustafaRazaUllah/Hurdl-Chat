import 'package:hurdl_chat/Modules/profile/model/usermodel.dart';

class ChatModel {
  final int createdAt; // Timestamp (e.g., seconds since epoch)
  final List<UserModel> participants; // List of UserModel objects
  final List<String> participantsIDs; // List of participant IDs
  final String lastMessage;

  ChatModel({
    required this.createdAt,
    required this.participants,
    required this.participantsIDs,
    required this.lastMessage,
  });

  // Convert ChatModel to a Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'createdAt': createdAt,
      'participants': participants.map((user) => user.toFirestore()).toList(),
      'participantsIDs': participantsIDs,
      'lastMessage': lastMessage,
    };
  }

  // Create a ChatModel from Firestore Map
  factory ChatModel.fromFirestore(Map<String, dynamic> map) {
    return ChatModel(
      createdAt: map['createdAt'] as int,
      participants: (map['participants'] as List)
          .map((userMap) => UserModel.fromFirestore(userMap))
          .toList(),
      participantsIDs: List<String>.from(map['participantsIDs']),
      lastMessage: map['lastMessage'] as String,
    );
  }

  // Create a ChatModel from Firestore Map
  factory ChatModel.fromEmpty() {
    return ChatModel(
      createdAt: 0,
      participants: [],
      participantsIDs: [],
      lastMessage: "",
    );
  }
}
