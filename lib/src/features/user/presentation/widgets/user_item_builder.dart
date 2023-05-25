import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/box_shadow.dart';
import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/pages/user_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserItemBuilder extends StatelessWidget {
  final UserModel user;

  const UserItemBuilder({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          BlocProvider(
            create: (context) => sl<UserBloc>(),
            child: UserDetailsPage(userId: user.id!),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? kDarkPrimaryColor : kWhite,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            KBoxShadow.containerShadow(),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            title: Text(
              '${user.name?.firstname} ${user.name?.lastname}'.capitalizedFirst,
              maxLines: 2,
              style: context.textTheme.titleMedium!,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  '${user.phone}',
                  maxLines: 2,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: kBlueGrey,
                  ),
                ),
                Text(
                  '${user.email}',
                  maxLines: 2,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: kBlueGrey,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
