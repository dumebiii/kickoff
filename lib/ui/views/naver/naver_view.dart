import 'package:flutter/material.dart';
import 'package:kickoff/ui/common/app_colors.dart';
import 'package:kickoff/ui/views/cart/cart_view.dart';
import 'package:kickoff/ui/views/home/home_view.dart';
import 'package:kickoff/ui/views/liked/liked_view.dart';
import 'package:kickoff/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';

import 'naver_viewmodel.dart';

class NaverView extends StackedView<NaverViewModel> {
  const NaverView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NaverViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        selectedIconTheme: const IconThemeData(color: kgreen),
        unselectedIconTheme: IconThemeData(color: kblack.withOpacity(0.4)),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Checkout',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.face,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: getViewForIndex(viewModel.currentIndex),
    );
  }

  @override
  NaverViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NaverViewModel();

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const LikedView();
      case 2:
        return const CartView();
      case 3:
        return const ProfileView();

      default:
        return const HomeView();
    }
  }
}
