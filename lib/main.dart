import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/HomeScreen.dart';
import 'package:green_leaf_app/controller/cartController.dart';
import 'package:green_leaf_app/controller/favoriteController.dart';
import 'package:green_leaf_app/controller/home_controller.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  final cartController = Get.put(CartController());
  final favoriteController = Get.put(FavoriteController());
  final homeController = Get.put(HomeController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Leaf',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 4000), () {
      //Navigate to next Screen
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/background.png",
                fit: BoxFit.fill,
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Image.asset("assets/green_leaf.png"))
          ],
        ),
      ),
    );
  }
}
