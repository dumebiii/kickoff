import 'package:flutter/material.dart';
import 'package:kickoff/ui/common/app_colors.dart';
import 'package:kickoff/ui/common/ui_helpers.dart';
import 'package:kickoff/ui/widget/new_arrivals.dart';
import 'package:kickoff/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    print(viewModel.product);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kwhite,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 44,
                width: 230,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 20,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for anything',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.notifications_none,
                    size: 34,
                  ),
                  horizontalSpace(20),
                  GestureDetector(
                    onTap: () {
                      viewModel.navigateCart();
                    },
                    child: SizedBox(
                      height: 44,
                      width: 44,
                      child: Stack(
                        children: [
                          Container(
                              height: 40,
                              width: 44,
                              child: Image.asset('assets/images/cart.png')),
                          Positioned(
                            top: -5,
                            left: 28,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kwhite,
                                border: Border.all(color: kgreen, width: 1),
                              ),
                              child: Center(
                                child: Text(
                                  viewModel.cart.length.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .black, // Change text color as needed
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 5, left: 18, right: 18),
            child: Column(
              children: [
                Image.asset('assets/images/hero.png'),
                verticalSpaceSmall,
                NewArrivals(viewModel: viewModel)
              ],
            ),
          ),
        ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
