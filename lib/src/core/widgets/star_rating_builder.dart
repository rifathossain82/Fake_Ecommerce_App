import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRatingBuilder extends StatelessWidget {
  final int starCount;
  final double? starSize;
  final num rating;
  final RatingChangeCallback? onRatingChanged;
  final Color color;
  final Color? blankStarColor;

  const StarRatingBuilder({
    super.key,
    this.starCount = 5,
    this.starSize,
    this.rating = .0,
    this.onRatingChanged,
    required this.color,
    this.blankStarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        starCount,
        (index) => buildStar(context, index),
      ),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: blankStarColor ?? kGrey,
        size: starSize,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: starSize,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: starSize,
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }
}
