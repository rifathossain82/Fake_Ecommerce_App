import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/widgets/user_item_builder.dart';
import 'package:flutter/material.dart';

class UserListViewWidget extends StatelessWidget {
  final List<UserModel> userList;

  const UserListViewWidget({
    Key? key,
    required this.userList,
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
      itemCount: userList.length,
      itemBuilder: (context, index) => UserItemBuilder(
        user: userList[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
