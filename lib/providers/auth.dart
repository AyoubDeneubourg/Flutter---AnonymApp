import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
//import './product.dart';
// import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import '../services/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  String userMail;

  Future<bool> isAuth() async {
    // return token != null;
    await FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        return false;
      } else {
        print('User is signed in!');
        userMail = user.email;
        return "true";
      }
    });
    return null;
    // notifyListeners();
  }

  String get token {
/*     if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
    } */
    return _token;
//    return null;
  }

  Future<void> signup(Map authData, BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: authData['email'].toLowerCase(),
        password: authData['password'],
      );
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw HttpException(message: e.code);
      }
    } catch (e) {
      print(e);
      throw e;
    }

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(authData['email'].toLowerCase())
          .set({
        'firstName': authData['firstname'],
        'lastName': authData['lastname'],
        'userName': authData['username'],
        'school': authData['school'],
        'email': authData['email'],
      }).whenComplete(() {
        notifyListeners();
        Navigator.pop(context);
        Navigator.of(context).pushReplacementNamed('/');
        print('orheree2');
      });
    } catch (e) {
      print(e);
      print('orheree3');
    }
  }

  Future<void> signIn(Map authData, context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authData['email'],
        password: authData['password'],
      );
      print("heee");
      notifyListeners();
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed('/');
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void logout(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/');
    notifyListeners();
  }
}
