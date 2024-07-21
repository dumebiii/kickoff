import 'package:flutter/material.dart';
import 'package:kickoff/ui/common/app_colors.dart';
import 'package:kickoff/ui/common/app_strings.dart';
import 'package:kickoff/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'liked_viewmodel.dart';

class LikedView extends StackedView<LikedViewModel> {
  const LikedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LikedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: viewModel.shared.liked != null
            ? SafeArea(
                child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                  Icons.arrow_back_ios_new_outlined)),
                          horizontalSpace(24),
                          const Text(
                            'Liked',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Inter',
                              color: kblack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(24),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.4),
                          mainAxisSpacing: 12.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemCount: viewModel.shared.liked?.length,
                        itemBuilder: (context, index) {
                          // bool isInCart =
                          //     viewModel.shared.isLikedeCart
                          //      (viewModel.product!.items[index]);

                          // bool isLikedd =
                          //     viewModel.isLikedeCart(viewModel.product!.items[index]);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 180,
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.network(
                                  "$kimg/${viewModel.shared.liked![index].photos.first.url}?organization_id=$korganizationID&Appid=$kappID&Apikey=$kApiKey",
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

                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₦${viewModel.shared.formatPrice(viewModel.shared.liked![index].currentPrice.first.prices['NGN'][0])}",
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
                                viewModel.shared.liked![index].name,
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
                    ]),
              ))
            : SafeArea(
                child: Center(
                  child: Text(
                    "No Liked Items",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: kblack.withOpacity(0.6),
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ));
  }

  @override
  LikedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LikedViewModel();
}
