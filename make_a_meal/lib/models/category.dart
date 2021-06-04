import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String recipie;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
    @required this.recipie,
  });
}

/* import 'package:flutter/material.dart';


class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.yellow,
  });
}
 */
