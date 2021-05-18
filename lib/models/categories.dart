import 'package:flutter/material.dart';

class Category {
  final String title;
  final Color color;
  final bool isLiked;

  Category({this.title, this.color, this.isLiked});
}

class Categories {
  List<Category> _items = [
    Category(
      title: 'Bienvenue1',
      color: Colors.grey,
      isLiked: true,
    ),
    Category(
      title: 'Bienvenue2',
      color: Colors.blueGrey,
      isLiked: true,
    ),
    Category(
      title: 'Bienvenue3',
      color: Colors.grey,
      isLiked: true,
    ),
    Category(
      title: 'Bienvenue4',
      color: Colors.blueGrey,
      isLiked: true,
    ),
    Category(
      title: 'Bienvenue5',
      color: Colors.grey,
      isLiked: true,
    ),
    Category(
      title: 'Bienvenue6',
      color: Colors.blueGrey,
      isLiked: true,
    ),
    Category(
      title: 'Bienvenue7',
      color: Colors.grey,
      isLiked: true,
    ),
    Category(
      title: 'Bienvenue8',
      color: Colors.blueGrey,
      isLiked: true,
    ),
    Category(
      title: 'Bienvenue9',
      color: Colors.grey,
      isLiked: true,
    ),
    Category(
      title: 'Bienvenue10',
      color: Colors.blueGrey,
      isLiked: true,
    ),
  ];

  List<Category> get items {
    return _items;
  }
}
