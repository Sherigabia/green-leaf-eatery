import 'dart:convert';

List<Food> foodListFromJson(String val) => List<Food>.from(
  json.decode(val)['data'].map((food) =>Food.fromJson(food))
);


class Food {
  final int id;
  final String foodname;
  final String img;
  final String description;
  final int price;
  Food(
      {required this.id,
      required this.foodname,
      required this.img,
      required this.description,
      required this.price});

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      foodname: data['attributes']['foodname'],
      img: data['attributes']['image']['data']['attributes']['url'],
      description: data['attributes']['description'],
      price: data['attributes']['price']);

  // static List<Food> allmeals = [
  //   Food(
  //       id: 1,
  //       foodname: "Pizza",
  //       img: "assets/images/pizza.jpg",
  //       description: "Peperroni Pizza",
  //       price: 25),
  //   Food(
  //       id: 2,
  //       foodname: "Banku",
  //       img: "assets/images/banku-tilapia.jpeg",
  //       description: "Banku with Grilled Tilapia",
  //       price: 35),
  //   Food(
  //       id: 3,
  //       foodname: "Noodles",
  //       img: "assets/images/noodles.jpg",
  //       description: "Spicy Noodles with Chicken",
  //       price: 25),
  //   Food(
  //       id: 4,
  //       foodname: "Grilled Chicken",
  //       img: "assets/images/chicken.jpg",
  //       description: "Spicy Grilled Chicken",
  //       price: 35),
  // ];
}
