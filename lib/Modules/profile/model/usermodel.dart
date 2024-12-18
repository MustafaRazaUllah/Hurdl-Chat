class UserModel {
  final String userID;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String address;
  final String gender;

  UserModel({
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.gender,
  });

  // Factory constructor to create a UserModel from a Firebase document snapshot
  factory UserModel.fromFirestore(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      gender: json['gender'] as String,
    );
  }

  // Factory constructor to create a UserModel from a Firebase document snapshot
  factory UserModel.fromEmpty() {
    return UserModel(
      userID: "",
      firstName: "",
      lastName: "",
      email: "",
      phoneNumber: "",
      address: "",
      gender: "",
    );
  }

  // Method to convert a UserModel to a map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'userID': userID,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
    };
  }
}
