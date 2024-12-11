import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/common/theme/custom_toast.dart';
import 'package:hurdl_chat/db%20and%20cache/cache.dart';

mixin AuthService {
  // Make instance of firebase Auth, Firestore instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register User With Firebase
  Future<String> registerUser({
    required String email,
    required String password,
  }) async {
    String resultUserID = "";
    try {
      UserCredential userData = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      String userID = userData.user?.uid ?? "";

      print("userID $userID");
      await _firestore.collection("users").doc(userID).set({
        "email": email,
        "userID": userID,
      });

      CustomtToast.success("User Registered Successfully");
      print("userID222 $userID");
      resultUserID = userID;
    } catch (e) {
      // Handle Error
    }
    return resultUserID;
  }

  Future<bool> createProfile({
    required String userID,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String address,
    required String gender,
  }) async {
    bool isUserCreate = false;
    try {
      await _firestore.collection("users").doc(userID).update({
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "address": address,
        "gender": gender,
      });

      await CacheHandle.setUID(userID);

      CustomtToast.success("Profile Created Successfully");
      // Create User Profile
      isUserCreate = true;
    } catch (e) {
      // Handle Error
    }
    return isUserCreate;
  }

// Login method
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String resultUserID = "";
    try {
      // Attempt to sign in with email and password
      UserCredential userData = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Extract user ID
      String userID = userData.user?.uid ?? "";

      if (userID.isNotEmpty) {
        // Save user ID to cache
        await CacheHandle.setUID(userID);

        // Show success message
        CustomtToast.success("User logged in successfully!");
        resultUserID = userID;
      } else {
        // Unexpected empty user ID case
        CustomtToast.error(
          "Login failed. Please try again.",
          seconds: 5,
        );
      }
    } catch (e) {
      // Handle specific exceptions
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case "user-not-found":
            CustomtToast.error(
              "No user found with this email.",
              seconds: 5,
            );
            break;
          case "wrong-password":
            CustomtToast.error(
              "Incorrect password. Please try again.",
              seconds: 5,
            );
            break;
          case "invalid-email":
            CustomtToast.error(
              "The email address is not valid.",
              seconds: 5,
            );
            break;
          case "user-disabled":
            CustomtToast.error(
              "This user account has been disabled.",
              seconds: 5,
            );
            break;
          case "too-many-requests":
            CustomtToast.error(
              "Too many login attempts. Please try again later.",
              seconds: 5,
            );
            break;
          default:
            CustomtToast.error(
              "An unexpected error occurred: ${e.message}",
              seconds: 5,
            );
        }
      } else {
        // General exception handling
        CustomtToast.error(
          "Something went wrong: ${e.toString()}",
          seconds: 5,
        );
      }
    }
    return resultUserID;
  }
}
