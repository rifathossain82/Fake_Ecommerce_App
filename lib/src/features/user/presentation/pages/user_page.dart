import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/helpers/helper_methods.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/filter_widget.dart';
import 'package:fake_ecommerce_app/src/core/widgets/no_data_found.dart';
import 'package:fake_ecommerce_app/src/core/widgets/shimmer_list_view_builder.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/pages/add_or_update_user_page.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/widgets/user_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final limitTextController = TextEditingController();

  /// initial focus scope node
  FocusScopeNode focusScopeNode = FocusScopeNode();

  @override
  void initState() {
    context.read<UserBloc>().add(GetUserList());
    limitTextController.text = context.read<UserBloc>().limit ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: focusScopeNode,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async => onRefreshMethod(),
          child: Column(
            children: [
              BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return FilterWidget(
                    limitTextController: limitTextController,
                    onChangedLimit: (value) {
                      DeBouncer.run(() {
                        context.read<UserBloc>().updateLimit(value);
                        context.read<UserBloc>().reloadUserList();
                      });
                    },
                    selectedSortingType:
                        context.read<UserBloc>().selectedSorting,
                    onChangedSorting: (value) {
                      context.read<UserBloc>().updateSorting(value);
                      context.read<UserBloc>().reloadUserList();
                    },
                    onTapAddButton: addButtonMethod,
                  );
                },
              ),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }

  void addButtonMethod() async {
    context
        .push(
      BlocProvider(
        create: (context) => sl<UserBloc>(),
        child: const AddOrUpdateUserPage(
          pageType: PageType.add,
        ),
      ),
    )
        .then((value) {
      if (value != null && value == true) {
        onRefreshMethod();
      }
    });
  }

  void onRefreshMethod() {
    /// clear filtering value from bloc and reload user list
    context.read<UserBloc>().clearFiltering();
    context.read<UserBloc>().reloadUserList();

    /// clear the limit text field
    limitTextController.clear();

    /// to unFocus dropdown field
    focusScopeNode.unfocus();
  }
}
