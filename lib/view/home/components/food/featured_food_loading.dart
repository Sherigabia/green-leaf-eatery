import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedFoodLoadingCard extends StatelessWidget {
  const FeaturedFoodLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Shimmer.fromColors(
          child: Container(
              width: 270,
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10))),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white),
    );
  }
}
