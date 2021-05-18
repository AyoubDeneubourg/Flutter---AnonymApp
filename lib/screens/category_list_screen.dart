import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:AnonymApp/models/categories.dart';
import 'package:AnonymApp/providers/categories.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  static String routeName = "/category_list_screen";

  final Map oneCategory;
  CategoryList(this.oneCategory);

  @override
  Widget build(BuildContext context) {
    print(oneCategory);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          oneCategory['categoryName'],
        ),
        elevation: 5,
      ),
      body: ListView.builder(
          itemCount: oneCategory['rooms'].length,
          itemBuilder: (ctx, i) {
            return Card(
              //  color: _items[i].color,
              child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  Navigator.pushNamed(context, "/chat-room-screen",
                      arguments: oneCategory['rooms'][i]);
                  /*      Provider.of<AllCategories>(context, listen: false)
                      .addCategory(); */
                },
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.star_border),
                    onPressed: () {},
                  ),
                  /*            title: Text(newRooms[i].toString()),
                            leading: Text(_items[i].title), */
                  subtitle: Text(oneCategory['rooms'][i]['roomName']),
                ),
              ),
            );
          }),
    );
  }
}
