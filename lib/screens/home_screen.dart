import 'package:flutter/material.dart';
import 'package:AnonymApp/widgets/home_list.dart';
import '../widgets/test.dart';

class HomePage extends StatefulWidget {
/*   final String title;
  ProductDetailScreen(this.title); */

  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context).settings.arguments; // as String;
    return HomeList();
  }
}
