import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_floating_action_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/no_data_found.dart';
import 'package:fake_ecommerce_app/src/core/widgets/shimmer_list_view_builder.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/pages/add_or_update_user_page.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/widgets/user_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(GetUserList());
    return Scaffold(
      floatingActionButton: KFloatingActionButton(
        onPressed: () => context.push(
          const AddOrUpdateUserPage(
            pageType: PageType.add,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UserBloc>().isUserListLoaded = false;
          context.read<UserBloc>().add(GetUserList());
        },
        child: Stack(
          children: [
            ListView(),
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserError) {
                  context.showSnackBar(
                    message: state.message,
                    bgColor: failedColor,
                  );
                }
              },
              builder: (context, state) {
                if (state is UserInitial || state is UserLoading) {
                  return const ShimmerListViewBuilder();
                } else if (state is UserLoaded) {
                  return UserListViewWidget(userList: state.userList);
                } else {
                  return const NoDataFound();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
