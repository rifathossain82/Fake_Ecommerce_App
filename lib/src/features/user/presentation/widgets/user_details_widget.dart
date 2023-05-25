import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/box_shadow.dart';
import 'package:fake_ecommerce_app/src/core/widgets/row_text.dart';
import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserModel user;

  const UserDetailsWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: context.isDark ? kDarkPrimaryColor : kWhite,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              KBoxShadow.containerShadow(),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RowText(
                title: 'Name',
                value: '${user.name?.firstname} ${user.name?.lastname}'
                    .capitalizedFirst,
                paddingBottom: 5,
              ),
              RowText(
                title: 'Phone',
                value: '${user.phone}',
                paddingBottom: 5,
              ),
              RowText(
                title: 'E-mail',
                value: '${user.email}',
                paddingBottom: 5,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: context.isDark ? kDarkPrimaryColor : kWhite,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              KBoxShadow.containerShadow(),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RowText(
                title: 'City',
                value: '${user.address?.city}',
                paddingBottom: 5,
              ),
              RowText(
                title: 'Street',
                value: '${user.address?.street}',
                paddingBottom: 5,
              ),
              RowText(
                title: 'Number',
                value: '${user.address?.number}',
                paddingBottom: 5,
              ),
              RowText(
                title: 'Zip Code',
                value: '${user.address?.zipcode}',
                paddingBottom: 5,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: context.isDark ? kDarkPrimaryColor : kWhite,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              KBoxShadow.containerShadow(),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_on,
                      color: kBlueGrey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      color: kBlueGrey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.email,
                      color: kBlueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
