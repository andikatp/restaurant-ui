import 'package:flutter/material.dart';

class RatingStarsWidget extends StatelessWidget {
  final int ratingStars;

  // ignore: use_key_in_widget_constructors
  const RatingStarsWidget(this.ratingStars);

  @override
  Widget build(BuildContext context) {
    return Text(
      '⭐  ' * ratingStars,
      style: const TextStyle(fontSize: 18.0),
    );
  }
}
