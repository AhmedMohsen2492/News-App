import 'package:flutter/material.dart';

class CategoryDM {
  String id ;
  String title;
  String imagePath;
  bool isLeftSide;
  Color backgroundColor ;

  CategoryDM({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.isLeftSide,
    required this.backgroundColor
});

  static List<CategoryDM> categories = [
    CategoryDM(
        id: "sports",
        title: "Sports",
        imagePath: "assets/images/ball.png",
        isLeftSide: true,
        backgroundColor: Colors.red[900]!),

    CategoryDM(
        id: "technology",
        title: "Technology",
        imagePath: "assets/images/Politics.png",
        isLeftSide: false,
        backgroundColor: Colors.blue[900]!),

    CategoryDM(
        id: "health",
        title: "Health",
        imagePath: "assets/images/health.png",
        isLeftSide: true,
        backgroundColor: Colors.pink),

    CategoryDM(
        id: "business",
        title: "Business",
        imagePath: "assets/images/bussines.png",
        isLeftSide: false,
        backgroundColor: Colors.orange[900]!),

    CategoryDM(
        id: "entertainment",
        title: "Entertainment",
        imagePath: "assets/images/environment.png",
        isLeftSide: true,
        backgroundColor: Colors.lightBlue),

    CategoryDM(
        id: "science",
        title: "Science",
        imagePath: "assets/images/science.png",
        isLeftSide: false,
        backgroundColor: Colors.yellow[500]!)
  ];
}