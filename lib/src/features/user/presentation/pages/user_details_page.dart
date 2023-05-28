import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_custom_loader.dart';
import 'package:fake_ecommerce_app/src/core/widgets/no_data_found.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/widgets/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatelessWidget {
  final int userId;

  const UserDetailsPage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(GetUserDetails(userId: userId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UserBloc>().add(GetUserDetails(userId: userId));
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
                if (state is UserDetailsLoading) {
                  return const KCustomLoader();
                } else if (state is UserDetailsLoaded) {
                  return BlocProvider(
                    create: (context) => sl<UserBloc>(),
                    child: UserDetailsWidget(user: state.user),
                  );
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
