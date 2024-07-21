import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kickoff/ui/common/app_colors.dart';
import 'package:kickoff/ui/common/app_strings.dart';
import 'package:kickoff/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    double totalPriceSum = viewModel.shared.items!.fold<double>(0, (sum, item) {
      double itemPrice = item.currentPrice.first.prices['NGN'][0];
      return sum + itemPrice;
    });

    return Scaffold(
        body: viewModel.shared.items != null
            ? SafeArea(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Cart',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  color: kblack,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${viewModel.shared.items!.length} items',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  color: kblack,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          SizedBox(
                            height: 400,
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount: viewModel.shared.items!.length,
                                itemBuilder: (context, index) {
                                  double price = viewModel.shared.items![index]
                                      .currentPrice.first.prices['NGN'][0];
                                  double quantity = viewModel
                                      .shared.items![index].availableQuantity;
                                  print("THIS IS $quantity");
                                  double totalPerprice = price * quantity;

                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 120,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Image.network(
                                          "$kimg/${viewModel.shared.items![index].photos.first.url}?organization_id=$korganizationID&Appid=$kappID&Apikey=$kApiKey",
                                          fit: BoxFit.contain,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return const Center(
                                              child: CircularProgressIndicator(
                                                color: kgreen,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      horizontalSpaceSmall,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              viewModel
                                                  .shared.items![index].name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Inter',
                                              ),
                                            ),
                                            verticalSpaceSmall,
                                            Text(
                                              "₦${viewModel.formatPrice(totalPerprice)}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                color: kgreen,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            verticalSpaceSmall,
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "M",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color:
                                                        kblack.withOpacity(0.6),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Inter',
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        viewModel
                                                            .decrementQuantity(
                                                                quantity);
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/minus.png',
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                    ),
                                                    horizontalSpaceSmall,
                                                    Text(
                                                      viewModel.formatNumber(
                                                          quantity),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: kblack
                                                            .withOpacity(0.6),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Inter',
                                                      ),
                                                    ),
                                                    horizontalSpaceSmall,
                                                    GestureDetector(
                                                      onTap: () {
                                                        viewModel
                                                            .incrementQuantity(
                                                                quantity);
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/plus.png',
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            verticalSpaceSmall,
                                            GestureDetector(
                                              onTap: () {
                                                // viewModel.shared.items!.remove(
                                                //     viewModel.shared.items![index]);
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/trash.png',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  horizontalSpaceTiny,
                                                  Text(
                                                    'Remove',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Inter',
                                                      color: kblack
                                                          .withOpacity(0.4),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            verticalSpaceSmall
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ),
                          verticalSpaceMedium,
                          const Text(
                            'Order Summary',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Inter',
                              color: kblack,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          verticalSpaceSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Items',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  color: kblack,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                viewModel.shared.items!.length.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  color: kblack,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  color: kblack,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '₦ 5,000',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  color: kblack,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Services',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  color: kblack,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '₦ 5,000',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  color: kblack,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceSmall,
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: kblack.withOpacity(
                                    0.24), // You can change this to any color you want
                                width:
                                    1.0, // This controls the thickness of the border in pixels
                              ),
                            ),
                            // You can add any other widgets you want inside the container here
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Do you have a Coupon Code?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      color: kblack,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  verticalSpaceTiny,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 44,
                                        width: 224,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 12.0,
                                                    horizontal: 16.0),
                                            hintText: 'Enter Coupon Code',
                                            hintStyle: TextStyle(
                                                color: kblack.withOpacity(0.5)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                color: kblack.withOpacity(
                                                    0.5), // Border color
                                                width: 1, // Border width
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                color: kblack.withOpacity(
                                                    0.5), // Border color
                                                width: 1.0, // Border width
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                color: kblack.withOpacity(
                                                    0.5), // Border color
                                                width: 1.0, // Border width
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 44,
                                        width: 68,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color:
                                                  kgreen), // Border color with opacity
                                          borderRadius: BorderRadius.circular(
                                              4), // Rounded corners
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Apply', // Replace with your actual text
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Inter',
                                              color: Colors.black.withOpacity(
                                                  0.6), // Text color with opacity
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: kwhite,
                            border: Border.all(
                                width: 1, color: kblack.withOpacity(0.12)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Subtotal', // Replace with your actual text
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Inter',
                                          color: kblack.withOpacity(0.6),
                                        ),
                                      ),
                                      verticalSpaceTiny,
                                      Text(
                                        "₦${viewModel.formatPrice(totalPriceSum)}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Inter',
                                            color: kgreen),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.navigateCheckout();
                                    },
                                    child: Container(
                                      height: 48,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          color: kgreen,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Center(
                                          child: Text(
                                        'Make Payment',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Inter',
                                            color: kwhite),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SafeArea(
                child: Center(
                  child: Text(
                    "No Items in cart",
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
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
