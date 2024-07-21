import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kickoff/ui/common/app_colors.dart';
import 'package:kickoff/ui/views/cart/cart_view.dart';
import 'package:kickoff/ui/views/home/home_view.dart';
import 'package:kickoff/ui/views/liked/liked_view.dart';
import 'package:kickoff/ui/views/profile/profile_view.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  var current_index;
  List<Widget> _pages = [];
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    current_index = 0;

    _pages = [HomeView(), LikedView(), CartView(), ProfileView()];

    _pageController = PageController(initialPage: current_index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: current_index,
          onTap: (int index) {
            setState(() {
              current_index = index;
              _pageController!.jumpToPage(current_index);
            });
          },
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
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _pages,
        ));
  }
}
