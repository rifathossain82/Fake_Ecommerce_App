import 'package:fake_ecommerce_app/src/features/category/presentation/widgets/category_item_builder.dart';
import 'package:flutter/material.dart';

class CategoryListViewWidget extends StatelessWidget {
  final List<String> categoryList;

  const CategoryListViewWidget({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
        bottom: 80,
      ),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: categoryList.length,
      itemBuilder: (context, index) => CategoryItemBuilder(
        name: categoryList[index],
        index: index,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
    );
  }
}
