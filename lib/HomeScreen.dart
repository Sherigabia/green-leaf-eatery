import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/Widgets/featuredFoodCard.dart';
import 'package:green_leaf_app/Widgets/foodCard.dart';
import 'package:green_leaf_app/allMeals.dart';
import 'package:green_leaf_app/cartPage.dart';
import 'package:green_leaf_app/controller/cartController.dart';
import 'package:green_leaf_app/controller/controllers.dart';
import 'package:green_leaf_app/controller/favoriteController.dart';
import 'package:green_leaf_app/favourites.dart';
import 'package:green_leaf_app/mealPage.dart';
import 'package:green_leaf_app/models/foods_model.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CartController controller = Get.find();
  final FavoriteController _favoriteController = Get.find();

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
              title: Text("GreenLeaf"),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      Obx(() => Badge(
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
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 85,
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //Green leaf Card Widget Goess here
                                      Expanded(
                                        child: Card(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 10),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                        image: const DecorationImage(
                                                            image: AssetImage(
                                                                "assets/green_leaf.png"),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0)),
                                                  ),
                                                  const SizedBox(width: 20.0),
                                                  Expanded(
                                                      child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Green Leaf Eatery",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text(
                                                        "Order your favourite meals and have it delivered to your door step ...",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 14.0,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Row(
                                                        children: const [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text(
                                                            "4.5",
                                                            style: TextStyle(
                                                              fontSize: 14.0,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          const Icon(
                                                            Icons.timer,
                                                            color: Colors.grey,
                                                          ),
                                                          const SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text(
                                                            "Fast Delivery",
                                                            style: TextStyle(
                                                              fontSize: 14.0,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/food.jpg"),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.darken),
                          fit: BoxFit.cover)),
                ),
              )),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 24.0, 0, 10.0),
                      child: Text("Featured",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 10.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AllMealsPage()));
                          },
                          child: const Text("All Meals",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ],
                ),
                Obx(() {
                  if (homeController.foodList.isNotEmpty) {
                    return foodCardView(
                        controller: controller,
                        foodList: homeController.foodList);
                  } else {
                    return Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.shade300,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class foodCardView extends StatefulWidget {
  final List<Food> foodList;
  const foodCardView(
      {Key? key, required this.controller, required this.foodList})
      : super(key: key);

  final CartController controller;

  @override
  State<foodCardView> createState() => _foodCardViewState();
}

class _foodCardViewState extends State<foodCardView> {
  late List<Widget> _foodList;
  @override
  void initState() {
    _foodList = widget.foodList
        .map((e) => FoodCard(
              foodname: e.foodname,
              imageUrl: e.img,
              price: e.price,
              description: e.description,
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        primary: false,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Obx(() => Column(
                children: [
                  InkWell(
                    onTap: () {
                      // widget.controller.addFood(Food.allmeals[index]);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MealPage(
                                food: homeController.foodList[index],
                                index: index,
                              )));
                    },
                    child: FeaturedCard(
                      name: homeController.foodList[index].foodname,
                      imgUrl: homeController.foodList[index].img,
                      price: "GH₵ ${homeController.foodList[index].price}",
                    ),
                  )
                ],
              ));
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: 2);
  }
}
