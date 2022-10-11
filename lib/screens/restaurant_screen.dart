import 'package:flutter/material.dart';
import 'package:restaurant/models/food.dart';
import '../models/restaurant.dart';
import '../widgets/rating_stars_widget.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantScreen({super.key, required this.restaurant});

  _buildMenuItem(Food menuItem, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            menuItem.imageUrl,
            height: 175,
            width: 175,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 175,
          height: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
                Colors.black54.withOpacity(0.3),
                Colors.black38.withOpacity(0.3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.4, 0.6, 0.9],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              menuItem.name,
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${menuItem.price}',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Positioned(
          bottom: 20.0,
          right: 10.0,
          child: Container(
            width: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              iconSize: 30.0,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Hero(
              tag: restaurant.imageUrl,
              child: Image.asset(
                restaurant.imageUrl,
                height: 220,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                    ),
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      '0.2 miles away',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                RatingStarsWidget(restaurant.rating),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  restaurant.address,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Reviews',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Contact',
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(restaurant.menu.length, (index) {
                Food food = restaurant.menu[index];
                return Center(
                  child: _buildMenuItem(food, context),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
