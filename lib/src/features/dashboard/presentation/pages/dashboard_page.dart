import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/box_shadow.dart';
import 'package:fake_ecommerce_app/src/features/cart/presentation/pages/cart_page.dart';
import 'package:fake_ecommerce_app/src/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:fake_ecommerce_app/src/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:fake_ecommerce_app/src/features/dashboard/presentation/widgets/bottom_navigation_item_builder.dart';
import 'package:fake_ecommerce_app/src/features/home/presentation/pages/homepage.dart';
import 'package:fake_ecommerce_app/src/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  late final DashboardCubit dashboardCubit;
  final List<Widget> pages = [
    const SettingsPage(),
    const Homepage(),
    const CartPage(),
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
    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,
      child: pages[dashboardCubit.bottomNavBarIndex],
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
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          KBoxShadow.containerShadow(),
        ],
      ),
      child: Row(
        children: [
          BottomNavigationItemBuilder(
            onTap: () => dashboardCubit.updateBottomNavBarIndex(0),
            isSelected: dashboardCubit.bottomNavBarIndex == 0,
            name: 'Settings',
            icon: Icons.settings_rounded,
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
            name: 'Cart',
            icon: Icons.shopping_cart_rounded,
          ),
        ],
      ),
    );
  }
}