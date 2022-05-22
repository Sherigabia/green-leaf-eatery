import 'dart:convert';

List<Food> FoodListFromJson(String val) =>
    List<Food>.from(jsonDecode(val)['data'].map((food) => Food.fromJson(food)));

class Food {
  final int id;
  final String name;
  final String image;

  Food({required this.id, required this.name, required this.image});

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      name: data['attributes']['foodname'],
      image: data['attributes']['image']['data']['attributes']['url']);
}
