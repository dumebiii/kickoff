// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kickoff/ui/common/app_colors.dart';
import 'package:kickoff/ui/common/app_strings.dart';
import 'package:kickoff/ui/common/ui_helpers.dart';
import 'package:kickoff/ui/views/home/home_viewmodel.dart';

class NewArrivals extends StatelessWidget {
  final HomeViewModel viewModel;
  NewArrivals({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'New Arrivals',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Inter',
                color: kblack,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'see more',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                color: kgreen,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        viewModel.isBusy
            ? Column(
                children: const [
                  Center(
                    child: CircularProgressIndicator(
                      color: kgreen,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              )
            : GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.4),
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: viewModel.product!.items.length,
                itemBuilder: (context, index) {
                  bool isInCart =
                      viewModel.isInCart(viewModel.product!.items[index]);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 180,
                              width: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.network(
                                "$kimg/${viewModel.product!.items[index].photos.first.url}?organization_id=$korganizationID&Appid=$kappID&Apikey=$kApiKey",
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: kgreen,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              top: 120,
                              left: 8,
                              right: 8,
                              bottom: 4,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // viewModel.toggleItemattractive();
                                    },
                                    child: viewModel.isattractive
                                        ? Image.asset(
                                            'assets/images/fave.png',
                                            height: 34,
                                            width: 34,
                                          )
                                        : Image.asset(
                                            'assets/images/favi.png',
                                            height: 34,
                                            width: 34,
                                          ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        if (isInCart) {
                                          viewModel.removeItem(
                                              viewModel.product!.items[index]);
                                        } else {
                                          viewModel.addItem(
                                              viewModel.product!.items[index]);
                                        }
                                      },
                                      child: isInCart
                                          ? Image.asset(
                                              'assets/images/cart.png',
                                              height: 34,
                                              width: 34,
                                            )
                                          : Image.asset(
                                              'assets/images/carti.png',
                                              height: 34,
                                              width: 34,
                                            ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₦${viewModel.formatPrice(viewModel.product!.items[index].currentPrice.first.prices['NGN'][0])}",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: kgreen,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '3.5',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  color: kblack.withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 2),
                              Image.asset(
                                'assets/images/Star.png',
                                height: 16,
                                width: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        viewModel.product!.items[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Men's Jersey",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kblack.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 4), // Adjust spacing as needed
                    ],
                  );
                },
              ),
      ],
    );
  }
}
