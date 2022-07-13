import 'package:flutter/material.dart';
import 'package:green_leaf_app/Widgets/favoriteFoods.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Favourites"),
      ),
      body: ListView(
        children: [FavoriteFoods()],
      ),
    );
  }
}
