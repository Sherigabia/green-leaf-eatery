import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/controller/cartController.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        height: 170,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.15))
            ]),
        child: controller.foods.isNotEmpty
            ? SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.receipt_long,
                            size: 40,
                            color: Colors.orange,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Spacer(),
                        Text(
                          "Proceed to checkout",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                          color: Colors.grey[300],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(text: "Total: \n", children: [
                          TextSpan(
                            text: "GH ${controller.total}",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ])),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green,
                                ),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(8))),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Checkout",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text(
                    //       'Total',
                    //       style: TextStyle(
                    //           fontSize: 24, fontWeight: FontWeight.bold),
                    //     ),
                    //     Text(
                    //       'GH ${controller.total}',
                    //       style: const TextStyle(
                    //           fontSize: 24, fontWeight: FontWeight.bold),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              )
            : SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.receipt_long,
                            size: 40,
                            color: Colors.grey,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Spacer(),
                        Text(
                          "No food found",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                          color: Colors.grey[300],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(text: "Total: \n", children: [
                          TextSpan(
                            text: "GH 0",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ])),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.grey[300],
                                ),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(8))),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Checkout",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              )));
  }
}
