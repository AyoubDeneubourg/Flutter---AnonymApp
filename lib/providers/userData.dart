import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String currentUserName = "Loading...";
  String currentFirstName = "Loading...";
  String currentLastName = "Loading...";
  String currentSchool = "Loading...";
  Map currentFavoriteRooms = {};

  User(
    this.currentUserName,
    this.currentFirstName,
    this.currentLastName,
    this.currentSchool,
  );

  String get userName {
    return currentUserName;
  }

  String get firstName {
    return currentFirstName;
  }

  String get lastName {
    return currentLastName;
  }

  String get school {
    return currentSchool;
  }
}

class UserData with ChangeNotifier {
  String userName = "Loading...";
  String firstName = "Loading...";
  String lastName = "Loading...";
  DocumentSnapshot currentDocumentSnapshots;

  User user = User("userName", "firstNamez", "lastName", "school");
  User get getUser {
    return user;
  }

  Future<void> getUserData(String email) async {
    print('coming');
    FirebaseFirestore.instance
        .collection('users')
        .doc(email.toLowerCase())
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        var data = documentSnapshot.data();
        //     print(data['username'] + "hee");
        this.user = User(data['userName'], data['firstName'], data['lastName'],
            data['school']);
      } else {
        return "err";
      }
      notifyListeners();
    });
  }
}
