import 'package:flutter/material.dart';

class MealPage extends StatelessWidget {
  String foodname;
  String description;
  String image;
  String price;

   MealPage(
      {Key? key,
      required this.foodname,
      required this.description,
      required this.image,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodname),
      ),
    );
  }
}
