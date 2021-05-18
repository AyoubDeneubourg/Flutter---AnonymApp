import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = "/edit-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit your profile")),
    );
  }
}
