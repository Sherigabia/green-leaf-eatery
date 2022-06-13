import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/Widgets/foodCard.dart';
import 'package:green_leaf_app/Widgets/searchInput.dart';
import 'package:green_leaf_app/cartPage.dart';
import 'package:green_leaf_app/controller/cartController.dart';
import 'package:green_leaf_app/controller/controllers.dart';
import 'package:green_leaf_app/controller/favoriteController.dart';
import 'package:green_leaf_app/favourites.dart';
import 'package:green_leaf_app/mealPage.dart';
import 'package:green_leaf_app/models/foods_model.dart';
import 'package:lottie/lottie.dart';

class AllMealsPage extends StatefulWidget {
  const AllMealsPage({Key? key}) : super(key: key);

  @override
  State<AllMealsPage> createState() => _AllMealsPageState();
}

class _AllMealsPageState extends State<AllMealsPage> {
  final CartController controller = Get.find();
  final FavoriteController _favoriteController = Get.find();
  // This list holds the data for the list view
  List<Food> foundMeals = [];

  @override
  void initState() {
    foundMeals = homeController.foodList;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Food> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = homeController.foodList;
    } else {
      results = homeController.foodList
          .where((food) => food.foodname
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundMeals = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("All Meals"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Obx(() => Row(
                  children: [
                    Badge(
                      badgeContent: Text(
                        '${controller.foods.length}',
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
                    ),
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
                )),
          )
        ],
        bottom: PreferredSize(
            child: Column(children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RoundedSearchInput(
                      hintText: 'Search food',
                      OnchangeText: (value) => _runFilter(value),
                    )),
              ),
            ]),
            preferredSize: Size.fromHeight(70)),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text("All Meals",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Expanded(
                child: foundMeals.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.addFood(foundMeals[index]);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MealPage(
                                            food: foundMeals[index],
                                            index: index,
                                          )));
                                },
                                child: FoodCard(
                                  
                                  description:
                                      "${foundMeals[index].description}",
                                  foodname: "${foundMeals[index].foodname}",
                                  price: foundMeals[index].price,
                                  imageUrl: '${foundMeals[index].img}',
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox();
                        },
                        itemCount: foundMeals.length)
                    : ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Lottie.asset(
                                "assets/images/not-found.json",
                              ),
                              Text(
                                "No results found ",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade300),
                              )
                            ],
                          );
                        }))
          ],
        ),
      ),
    );
  }
}
