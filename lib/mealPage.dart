import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/cartPage.dart';
import 'package:green_leaf_app/const.dart';
import 'package:green_leaf_app/controller/cartController.dart';
import 'package:green_leaf_app/controller/favoriteController.dart';
import 'package:green_leaf_app/favourites.dart';
import 'package:green_leaf_app/models/foods_model.dart';

class MealPage extends StatelessWidget {
  final CartController cartController = Get.find();

  final _favoriteController = Get.put(FavoriteController());
  final int index;

  final Food food;

  MealPage({
    Key? key,
    required this.food,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            floating: true,
            backgroundColor: Colors.green,
            elevation: 0,
            expandedHeight: (MediaQuery.of(context).size.height / 2.5),
            pinned: true,
            title: Text(food.foodname),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Obx(() => Badge(
                          badgeContent: Text(
                            '${cartController.foods.length}',
                            style: TextStyle(color: Colors.white),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.4),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CartPage()));
                              },
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.white,
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Obx(() => Badge(
                          badgeContent: Text(
                            '${_favoriteController.foods.length}',
                            style: TextStyle(color: Colors.white),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.4),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FavouritesPage()));
                              },
                              icon: Icon(Icons.favorite),
                              color: Colors.white,
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(left: 16, top: 56),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 85,
                      ),
                      Text(food.foodname,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 36,
                              color: Colors.white)),
                      SizedBox(height: 5),
                      Text(food.description,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              color: Colors.white)),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${food.img}"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.darken),
                        fit: BoxFit.cover)),
              ),
            )),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber)),
                        onPressed: () {
                          _favoriteController.addFood(food);
                        },
                        child: Row(
                          children: [
                            Text(
                              "Save for later",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.favorite_outline_rounded,
                              color: Colors.white,
                            )
                          ],
                        )),
                    Spacer(),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blueGrey.shade900)),
                        onPressed: () {
                          // Error in here
                          cartController.addFood(food);
                        },
                        child: Row(
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "FoodName",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  food.foodname,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  food.description,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Price :",
                    ),
                    Text(
                      "GH₵ ${food.price}",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text("Quantity :"),
                    IconButton(
                        onPressed: () {
                          cartController.removeFood(food);
                        },
                        icon: Icon(Icons.remove_circle_outline,
                            color: Colors.red)),
                    Obx(() => Text(
                          '${cartController.foods.values.toList()[index]}',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        )),
                    IconButton(
                        onPressed: () {
                          cartController.addFood(food);
                        },
                        icon: Icon(Icons.add_circle_outline,
                            color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text("Total Cost : ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    Spacer(),
                    Obx(() => Text("GH₵ ${cartController.foodSubtotal[index]}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        )))
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.green,
                          ),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(18))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Order Now",
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
