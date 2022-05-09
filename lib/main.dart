import 'package:flutter/material.dart';
import 'package:green_leaf_app/HomeScreen.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Leaf',
      home: HomeScreen(),
    );
  }
}
