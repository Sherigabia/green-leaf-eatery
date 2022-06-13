import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/cartPage.dart';
import 'package:green_leaf_app/const.dart';
import 'package:green_leaf_app/controller/cartController.dart';
import 'package:green_leaf_app/controller/favoriteController.dart';
import 'package:green_leaf_app/favourites.dart';
import 'package:green_leaf_app/models/foods_model.dart';
import 'package:shimmer/shimmer.dart';

class FoodCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final _favoriteController = Get.put(FavoriteController());

  String foodname;
  String description;
  String imageUrl;
  int price;

  FoodCard(
      {Key? key,
      required this.foodname,
      required this.description,
      required this.imageUrl,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Shimmer.fromColors(
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
                    ),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodname,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'GH₵ $price',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
/* fix cart feature bug here*/
                          // cartController.addFood(Food.allmeals[index]);
                        },
                        tooltip: "add to cart",
                        icon: Icon(Icons.shopping_cart_outlined),
                        color: Colors.grey,
                      ),
                      IconButton(
                        onPressed: () {
                          // _favoriteController.addFood(Food.allmeals[index]);
                        },
                        tooltip: "add to favourites",
                        icon: Icon(
                          Icons.favorite_outline,
                        ),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
