import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/cartPage.dart';
import 'package:green_leaf_app/controller/cartController.dart';
import 'package:green_leaf_app/controller/favoriteController.dart';
import 'package:green_leaf_app/favourites.dart';
import 'package:green_leaf_app/models/foods_model.dart';
import 'package:lottie/lottie.dart';

class MealPage extends StatefulWidget {
  final int index;

  final Food food;
  final int quantity;
  const MealPage(
      {Key? key,
      required this.food,
      required this.index,
      required this.quantity})
      : super(key: key);

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage>
    with SingleTickerProviderStateMixin {
  final CartController cartController = Get.find();

  final _favoriteController = Get.put(FavoriteController());

  bool _success = true;

  //form key
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController referenceNumberController =
      TextEditingController();

  _registerUserRequest() async {
    if (_formKey.currentState!.validate()) {}
  }

  late int quantity;

  late AnimationController controller;

  @override
  void initState() {
    setState(() {
      quantity = widget.quantity;
    });
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
  }

  void showDoneDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset('assets/images/success.json',
                      repeat: false,
                      height: 100,
                      width: 100,
                      controller: controller, onLoaded: (composition) {
                    controller.forward();
                  }),
                  SizedBox(height: 10),
                  const Text(
                    "Item Added to Cart",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ));

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
            title: Text(widget.food.foodname),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Obx(() => Badge(
                          badgeContent: Text(
                            '${cartController.foods.length}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.4),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const CartPage()));
                              },
                              icon: const Icon(Icons.shopping_cart),
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
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.4),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const FavouritesPage()));
                              },
                              icon: const Icon(Icons.favorite),
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
                padding: const EdgeInsets.only(left: 16, top: 56),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(widget.food.foodname,
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 36,
                              color: Colors.white)),
                      const SizedBox(height: 5),
                      Text(widget.food.description,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              color: Colors.white)),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.food.img),
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
                    // TextButton(
                    //     style: ButtonStyle(
                    //         backgroundColor: MaterialStateProperty.all(
                    //             Colors.blueGrey.shade900)),
                    //     onPressed: () {
                    //       cartController.addFood(widget.food);
                    //       setState(() {
                    //         quantity++;
                    //       });
                    //     },
                    //     child: Row(
                    //       children: const [
                    //         Text(
                    //           "Add to Cart",
                    //           style: TextStyle(color: Colors.white),
                    //         ),
                    //         SizedBox(
                    //           width: 5,
                    //         ),
                    //         Icon(
                    //           Icons.shopping_cart_outlined,
                    //           color: Colors.white,
                    //         )
                    //       ],
                    //     )),
                    // Spacer(),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber)),
                        onPressed: () {
                          _favoriteController.addFood(widget.food);
                        },
                        child: Row(
                          children: const [
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
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Food Name",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.food.foodname,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.food.description,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   children: [
                //     const Text(
                //       "Price :",
                //     ),
                //     Text(
                //       "GH₵ ${widget.food.price}",
                //       style: const TextStyle(
                //           fontSize: 24, fontWeight: FontWeight.w600),
                //     ),
                //     const Spacer(),
                //     const Text("Quantity :"),
                //     IconButton(
                //         onPressed: () {
                //           cartController.removeFood(widget.food);
                //           setState(() {
                //             quantity--;
                //           });
                //         },
                //         icon: const Icon(Icons.remove_circle_outline,
                //             color: Colors.red)),
                //     Text(
                //       "$quantity",
                //       style: const TextStyle(
                //           fontSize: 24, fontWeight: FontWeight.w600),
                //     ),
                //     IconButton(
                //         onPressed: () {
                //           cartController.addFood(widget.food);
                //           setState(() {
                //             quantity++;
                //           });
                //         },
                //         icon: const Icon(Icons.add_circle_outline,
                //             color: Colors.green)),
                //   ],
                // ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const Text("Price : ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    const Spacer(),
                    Text("GH₵ ${widget.food.price}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.green,
                          ),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(18))),
                      onPressed: () {
                        cartController.addFood(widget.food);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Add to Cart",
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
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  Future userDetailsDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                scrollable: true,
                title: const Center(
                  child: Text(
                    "Complete form Details",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                content: Stack(children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                            autofocus: false,
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "First name is required";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              firstNameController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.account_circle),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "First Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        const SizedBox(height: 10),
                        TextFormField(
                            autofocus: false,
                            controller: lastNameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Last name is required";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              lastNameController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.account_circle),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Last Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            autofocus: false,
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{10,}$');
                              if (value!.isEmpty) {
                                return "Phone number is required!";
                              }
                              if (!regex.hasMatch(value)) {
                                return "Enter a valid Phone Number ";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              phoneNumberController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.phone_android_outlined),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Phone Number",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ]),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop(false);
                        _registerUserRequest();
                      }
                    },
                    child: const Text(
                      "Proceed",
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text("Cancel",
                          style: TextStyle(fontSize: 24, color: Colors.red)))
                ]));
  }

  // Food Modal
// var randomNumber = "";
//                         var rnd = Random();
//                         for (var i = 0; i < 6; i++) {
//                           randomNumber =
//                               randomNumber + rnd.nextInt(9).toString();
//                         }
//                         // Random random = new Random();
//                         // int randomNumber = random.nextInt(100) + 1000000;
//                         // print(randomNumber);
//                         showModalBottomSheet(
//                             isScrollControlled: true,
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(20))),
//                             context: context,
//                             builder: (context) => Container(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         const SizedBox(
//                                           height: 20,
//                                         ),
//                                         Row(
//                                           children: [
//                                             CircleAvatar(
//                                                 radius: 40,
//                                                 backgroundImage: NetworkImage(
//                                                     widget.food.img)),
//                                             const Spacer(),
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   widget.food.foodname,
//                                                   style: const TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.w600),
//                                                 ),
//                                                 const SizedBox(height: 5),
//                                                 Text(
//                                                   widget.food.description,
//                                                   style: TextStyle(
//                                                       color: Colors.grey[600]),
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 20,
//                                         ),
//                                         Row(
//                                           children: [
//                                             const Text("Quantity : ",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 24)),
//                                             const Spacer(),
//                                             Text("$quantity",
//                                                 style: const TextStyle(
//                                                     fontSize: 20))
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           children: [
//                                             const Text("Reference code : ",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 24)),
//                                             const Spacer(),
//                                             Text(randomNumber,
//                                                 style: const TextStyle(
//                                                     fontSize: 20))
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           children: [
//                                             const Text("Total : ",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 24)),
//                                             const Spacer(),
//                                             Text(
//                                                 "GH₵ ${widget.food.price * quantity}",
//                                                 style: const TextStyle(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 24))
//                                           ],
//                                         ),
//                                         const SizedBox(height: 30),
//                                         const Center(
//                                           child: Text(
//                                               "Please enter the reference during payment",
//                                               style: TextStyle(
//                                                   color: Colors.grey)),
//                                         ),
//                                         const SizedBox(height: 10),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               left: 18.0, right: 18),
//                                           child: TextButton(
//                                               style: ButtonStyle(
//                                                   backgroundColor:
//                                                       MaterialStateProperty.all(
//                                                     Colors.green,
//                                                   ),
//                                                   padding:
//                                                       MaterialStateProperty.all(
//                                                           const EdgeInsets.all(
//                                                               18))),
//                                               onPressed: () {
//                                                 userDetailsDialog();
//                                               },
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: const [
//                                                   Text(
//                                                     "Proceed",
//                                                     style: TextStyle(
//                                                         fontSize: 24.0,
//                                                         color: Colors.white),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                   Icon(
//                                                     Icons.payment_outlined,
//                                                     color: Colors.white,
//                                                   )
//                                                 ],
//                                               )),
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ));
}
