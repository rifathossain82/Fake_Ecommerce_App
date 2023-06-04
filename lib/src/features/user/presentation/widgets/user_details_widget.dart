import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/helpers/helper_methods.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/box_shadow.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_outlined_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/row_text.dart';
import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/pages/add_or_update_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserModel user;

  const UserDetailsWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildUserDetailsBody(context),
        _buildEditAndDeleteButtons(context),
      ],
    );
  }

  Widget _buildUserDetailsBody(BuildContext context) {
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

  Widget _buildEditAndDeleteButtons(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 60,
        width: context.screenWidth,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KButton(
              onPressed: () => _editMethod(context),
              width: context.screenWidth * 0.44,
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: kWhite,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Edit',
                    style: context.buttonTextStyle,
                  ),
                ],
              ),
            ),
            KOutlinedButton(
              onPressed: () => _deleteMethod(context),
              width: context.screenWidth * 0.44,
              child: BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {
                  if (state.deletedStatus == Status.failure) {
                    context.showSnackBar(
                      message: state.message,
                      bgColor: failedColor,
                    );
                  }
                  if (state.deletedStatus == Status.success) {
                    context.showSnackBar(
                      message: state.message,
                      bgColor: successColor,
                    );

                    /// when user delete success then pop the screen
                    /// with result true for reload user list in user page
                    context.pop(result: true);
                  }
                },
                builder: (context, state) {
                  if (state.deletedStatus == Status.loading) {
                    return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: context.isDark ? kWhite : kLightPrimaryColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Delete',
                          style: context.outlinedButtonTextStyle,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editMethod(BuildContext context) {
    context.push(
      BlocProvider(
        create: (context) => sl<UserBloc>(),
        child: AddOrUpdateUserPage(
          pageType: PageType.update,
          user: user,
        ),
      ),
    ).then((value) {
      if (value != null && value == true) {
        /// reload user details after editing
        context.read<UserBloc>().add(GetUserDetails(userId: user.id!));

        /// clear all filtering values
        /// then reload user list to show updated user data
        context.read<UserBloc>().clearFiltering();
        context.read<UserBloc>().reloadUserList();
      }
    });
  }

  void _deleteMethod(BuildContext context) async {
    customDialog(
      context: context,
      dialogPosition: Alignment.center,
      title: 'Delete User?',
      content: Text(
        "Are you sure you want to delete this user? This can't be undone!",
        style: context.textTheme.bodyMedium,
      ),
      actions: [
        KOutlinedButton(
          onPressed: () => context.pop(result: true),
          width: context.screenWidth * 0.4,
          child: Text(
            'YES, DELETE',
            style: context.outlinedButtonTextStyle,
          ),
        ),
        KButton(
          onPressed: () => context.pop(result: false),
          width: context.screenWidth * 0.4,
          child: Text(
            'NO',
            style: context.buttonTextStyle,
          ),
        ),
      ],
    ).then((value) {
      if (value == true) {
        context.read<UserBloc>().add(DeleteUser(requestBody: user.toJson()));
      }
    });
  }
}
