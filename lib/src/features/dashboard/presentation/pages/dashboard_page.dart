import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/utils/asset_path.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/features/category/presentation/pages/category_page.dart';
import 'package:fake_ecommerce_app/src/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:fake_ecommerce_app/src/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:fake_ecommerce_app/src/features/dashboard/presentation/widgets/bottom_navigation_item_builder.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/pages/homepage.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  late final DashboardCubit dashboardCubit;
  final List<Widget> pages = [
    const CategoryPage(),
    const Homepage(),
    const UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    dashboardCubit = context.read<DashboardCubit>();
    return Scaffold(
      body: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildDashboardBody(context),
              Positioned(
                child: _buildBottomNavigationBar(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDashboardBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetPath.logo,
          height: 20,
          color: context.isDark ? kWhite : kLightPrimaryColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => context.pushNamed(
                routeName: RouteGenerator.settings,
              ),
              icon: const Icon(
                Icons.settings_rounded,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: pages[dashboardCubit.bottomNavBarIndex],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 55,
      width: context.screenWidth,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.isDark ? kDarkPrimaryColor : kWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 3.0),
            spreadRadius: 0,
            blurRadius: 4,
            color: kItemShadowColor,
          ),
          BoxShadow(
            offset: const Offset(0.0, -2.0),
            spreadRadius: 0,
            blurRadius: 4,
            color: kItemShadowColor,
          ),
        ],
      ),
      child: Row(
        children: [
          BottomNavigationItemBuilder(
            onTap: () => dashboardCubit.updateBottomNavBarIndex(0),
            isSelected: dashboardCubit.bottomNavBarIndex == 0,
            name: 'Category',
            icon: Icons.category_rounded,
          ),
          const SizedBox(width: 5),
          BottomNavigationItemBuilder(
            onTap: () => dashboardCubit.updateBottomNavBarIndex(1),
            isSelected: dashboardCubit.bottomNavBarIndex == 1,
            name: 'Home',
            icon: Icons.home_rounded,
          ),
          const SizedBox(width: 5),
          BottomNavigationItemBuilder(
            onTap: () => dashboardCubit.updateBottomNavBarIndex(2),
            isSelected: dashboardCubit.bottomNavBarIndex == 2,
            name: 'User',
            icon: Icons.people,
          ),
        ],
      ),
    );
  }
}
