import 'package:flutter/material.dart';

class HttpException implements Exception {
  final String message;

  HttpException({this.message = "errorMessage"});

  @override
  String toString() {
    return message;
  }

  String errorAuthentification(errorMessageF) {
    var errorMessage = 'Authentification failed.';
    var e = errorMessageF.toString();
    print(e);

    if (e.contains('EMAIL_EXISTS') ||
        e.contains("account-exists-with-different-credential") ||
        e.contains("email-already-in-use")) {
      errorMessage = 'This email adress is already in use.';
    }
    //
    else if (e.contains('INVALID_EMAIL') || e.contains('ERROR_INVALID_EMAIL')) {
      errorMessage = 'This is not a valid email.';
    }
    //
    else if (e.contains('WEAK_PASSWORD')) {
      errorMessage = 'This password is too weak.';
    }
    //
    else if (e.contains('EMAIL_NOT_FOUND') ||
        e.contains('user-not-found') ||
        e.contains('ERROR_USER_NOT_FOUND')) {
      errorMessage = 'Cound not find a user with that email.';
    }
    //
    else if (e.contains('INVALID_PASSWORD') ||
        e.contains('wrong-password') ||
        e.contains('ERROR_WRONG_PASSWORD')) {
      errorMessage = 'Invalid password.';
      print(e);
    }
    //
    else if (e.contains('ERROR_TOO_MANY_REQUESTS')) {
      errorMessage = 'Please retry later...';
    }
    return errorMessage;
  }

  void showErrorDialog(String message, context) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occured!'),
              content: Text(message),
              actions: [
                TextButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }
}
