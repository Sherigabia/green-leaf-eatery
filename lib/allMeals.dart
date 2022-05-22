import 'package:flutter/material.dart';
import 'package:green_leaf_app/Widgets/foodCard.dart';
import 'package:green_leaf_app/Widgets/searchInput.dart';
import 'package:green_leaf_app/cartPage.dart';
import 'package:green_leaf_app/favourites.dart';

class AllMealsPage extends StatefulWidget {
  const AllMealsPage({Key? key}) : super(key: key);

  @override
  State<AllMealsPage> createState() => _AllMealsPageState();
}

class _AllMealsPageState extends State<AllMealsPage> {
  final allmeals = [
    {
      'foodname': 'Pizza',
      'img': "assets/images/pizza.jpg",
      'description': "Peperroni Pizza",
      'price': "GH₵ 25"
    },
    {
      'foodname': 'Banku',
      'img': "assets/images/banku-tilapia.jpeg",
      'description': "Banku with Grilled Tilapia",
      'price': "GH₵ 30"
    },
    {
      'foodname': 'Noodles',
      'img': "assets/images/noodles.jpg",
      'description': "Spicy Noodles with Chicken",
      'price': "GH₵ 20"
    },
    {
      'foodname': 'Pizza',
      'img': "assets/images/pizza.jpg",
      'description': "Peperroni Pizza",
      'price': "GH₵ 25"
    },
    {
      'foodname': 'Banku',
      'img': "assets/images/banku-tilapia.jpeg",
      'description': "Banku with Grilled Tilapia",
      'price': "GH₵ 30"
    },
    {
      'foodname': 'Noodles',
      'img': "assets/images/noodles.jpg",
      'description': "Spicy Noodles with Chicken",
      'price': "GH₵ 20"
    },
    {
      'foodname': 'Pizza',
      'img': "assets/images/pizza.jpg",
      'description': "Peperroni Pizza",
      'price': "GH₵ 25"
    },
    {
      'foodname': 'Banku',
      'img': "assets/images/banku-tilapia.jpeg",
      'description': "Banku with Grilled Tilapia",
      'price': "GH₵ 30"
    },
    {
      'foodname': 'Noodles',
      'img': "assets/images/noodles.jpg",
      'description': "Spicy Noodles with Chicken",
      'price': "GH₵ 20"
    },
    {
      'foodname': 'Pizza',
      'img': "assets/images/pizza.jpg",
      'description': "Peperroni Pizza",
      'price': "GH₵ 25"
    },
    {
      'foodname': 'Banku',
      'img': "assets/images/banku-tilapia.jpeg",
      'description': "Banku with Grilled Tilapia",
      'price': "GH₵ 30"
    },
    {
      'foodname': 'Noodles',
      'img': "assets/images/noodles.jpg",
      'description': "Spicy Noodles with Chicken",
      'price': "GH₵ 20"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("All Meals"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CartPage()));
                    },
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FavouritesPage()));
                    },
                    icon: Icon(Icons.favorite),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
        bottom: PreferredSize(
            child: Column(children: const [
              Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RoundedSearchInput(hintText: 'Search food')),
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
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        FoodCard(
                          description: "${allmeals[index]['description']}",
                          foodname: "${allmeals[index]['foodname']}",
                          price: '${allmeals[index]['price']}',
                          image: '${allmeals[index]['img']}',
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemCount: allmeals.length),
            )
          ],
        ),
      ),
    );
  }
}
