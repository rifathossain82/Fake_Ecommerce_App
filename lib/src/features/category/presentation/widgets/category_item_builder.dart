import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/box_shadow.dart';
import 'package:fake_ecommerce_app/src/core/widgets/cached_network_image_builder.dart';
import 'package:fake_ecommerce_app/src/features/category/presentation/bloc/category_bloc.dart';
import 'package:fake_ecommerce_app/src/features/category/presentation/pages/category_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItemBuilder extends StatelessWidget {
  final String name;
  final int index;

  const CategoryItemBuilder({
    Key? key,
    required this.name,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        BlocProvider(
          create: (context) => sl<CategoryBloc>(),
          child: CategoryDetailsPage(categoryName: name),
        ),
      ),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: context.isDark ? kDarkPrimaryColor : kWhite,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            KBoxShadow.containerShadow(),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: CachedNetworkImageBuilder(
                imgURl:
                    'https://source.unsplash.com/random/?pilates#<%+new $index%>',
                fit: BoxFit.cover,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(4),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name.capitalizedFirst,
                      maxLines: 2,
                      style: context.textTheme.titleMedium!,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
