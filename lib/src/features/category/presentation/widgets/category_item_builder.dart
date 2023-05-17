import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/box_shadow.dart';
import 'package:flutter/material.dart';

class CategoryItemBuilder extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String name;

  const CategoryItemBuilder({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : kWhite,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : Theme.of(context).primaryColor,
            width: 1,
          ),
          boxShadow: [
            KBoxShadow.containerShadow(),
          ]
        ),
        child: Text(
          name,
          style: context.textTheme.caption!.copyWith(
            color: isSelected ? kWhite : kBlackLight,
          ),
        ),
      ),
    );
  }
}
