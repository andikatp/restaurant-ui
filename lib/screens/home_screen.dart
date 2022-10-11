import 'package:flutter/material.dart';
import 'package:restaurant/data/data.dart';
import 'package:restaurant/models/restaurant.dart';
import 'package:restaurant/screens/cart_screen.dart';
import 'package:restaurant/screens/restaurant_screen.dart';
import 'package:restaurant/widgets/rating_stars_widget.dart';
import 'package:restaurant/widgets/recent_order_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _buildRestaurant(BuildContext context) {
    List<Widget> restaurantList = [];
    // ignore: avoid_function_literals_in_foreach_calls
    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantScreen(restaurant: restaurant),
                ));
          },
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1.0,
              ),
            ),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image.asset(
                    restaurant.imageUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      RatingStarsWidget(restaurant.rating),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        restaurant.address,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      const Text(
                        '0.2 miles away',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      )
                    ]),
              )
            ]),
          ),
        ));
      },
    );
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Food Delivery')),
        leading: IconButton(
          icon: const Icon(
            Icons.account_circle,
            size: 30,
          ),
          onPressed: (() {}),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      return const CartScreen();
                    },
                  )),
              child: Text(
                'Cart (${currentUser.orders.length})',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search Food or Restaurant',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(width: 0.8)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(width: 0.8, color: Colors.red),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {},
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  )),
            ),
          ),
          const RecentOrderWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nerby Restaurant',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              _buildRestaurant(context),
            ],
          )
        ],
      ),
    );
  }
}
