import 'package:flutter/material.dart';
import '../widgets/notifications.dart';

class NotifPage extends StatelessWidget {
/*   final String title;
  ProductDetailScreen(this.title); */

  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final productId = ModalRoute.of(context).settings.arguments; // as String;
    return Container(
      width: deviceSize.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AllNotifs(),
      ),
    );
  }
}
