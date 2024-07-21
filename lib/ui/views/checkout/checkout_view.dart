import 'package:flutter/material.dart';
import 'package:kickoff/ui/common/app_colors.dart';
import 'package:kickoff/ui/common/app_strings.dart';
import 'package:kickoff/ui/common/ui_helpers.dart';
import 'package:kickoff/ui/widget/info_field.dart';
import 'package:kickoff/ui/widget/success.dart';
import 'package:stacked/stacked.dart';

import 'checkout_viewmodel.dart';

class CheckoutView extends StackedView<CheckoutViewModel> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckoutViewModel viewModel,
    Widget? child,
  ) {
    double totalPriceSum = viewModel.shared.items!.fold<double>(0, (sum, item) {
      double itemPrice = item.currentPrice.first.prices['NGN'][0];
      return sum + itemPrice;
    });

    String formattedTotalPriceSum = "₦${viewModel.formatPrice(totalPriceSum)}";
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new_outlined)),
              horizontalSpace(24),
              const Text(
                'Checkout',
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
          const Text(
            'Items',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          verticalSpaceSmall,
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
                itemCount: viewModel.shared.items!.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.network(
                          "$kimg/${viewModel.shared.items![index].photos.first.url}?organization_id=$korganizationID&Appid=$kappID&Apikey=$kApiKey",
                          fit: BoxFit.contain,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.shared.items![index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                              ),
                            ),
                            verticalSpaceTiny,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₦${viewModel.formatPrice(viewModel.shared.items![index].currentPrice.first.prices['NGN'][0])}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    color: kgreen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "M",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: kblack.withOpacity(0.6),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                Text(
                                  "X1",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: kblack.withOpacity(0.6),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
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
            'Delivery Options',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          verticalSpace(12),
          Image.asset('assets/images/deliv.png'),
          verticalSpaceSmall,
          const InfoField(
            text: 'First Name*',
          ),
          verticalSpace(12),
          const InfoField(
            text: 'Last Name*',
          ),
          verticalSpace(12),
          const InfoField(
            text: 'Email Name*',
          ),
          verticalSpace(12),
          const InfoField(
            text: 'Phone Number*',
          ),
          verticalSpace(12),
          const InfoField(
            text: 'Adress Line 1*',
          ),
          verticalSpace(12),
          const InfoField(
            text: 'Address Line 2*',
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Country*',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: kblack.withOpacity(0.7)),
                  ),
                  verticalSpaceTiny,
                  Container(
                    height: 44,
                    width: 166,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFD0D5DD), // Border color
                        width: 1, // Border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Country*',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: kblack.withOpacity(0.4)),
                          ),
                          verticalSpace(5),
                          Image.asset(
                            'assets/images/down.png',
                            height: 16,
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'State*',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: kblack.withOpacity(0.7)),
                  ),
                  verticalSpaceTiny,
                  Container(
                    height: 44,
                    width: 166,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFD0D5DD), // Border color
                        width: 1, // Border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'State*',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: kblack.withOpacity(0.4)),
                          ),
                          verticalSpace(5),
                          Image.asset(
                            'assets/images/down.png',
                            height: 16,
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Post code*',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: kblack.withOpacity(0.7)),
                  ),
                  verticalSpaceTiny,
                  Container(
                    height: 44,
                    width: 166,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFD0D5DD), // Border color
                        width: 1, // Border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Post code*',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: kblack.withOpacity(0.4)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'City*',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: kblack.withOpacity(0.7)),
                  ),
                  verticalSpaceTiny,
                  Container(
                    height: 44,
                    width: 166,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFD0D5DD), // Border color
                        width: 1, // Border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'City*',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: kblack.withOpacity(0.4)),
                          ),
                          verticalSpace(5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpaceMedium,
          const Text(
            'Payment Options',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          verticalSpace(12),
          Image.asset('assets/images/opt.png'),
          verticalSpace(12),
          const InfoField(text: 'Name on card*'),
          verticalSpace(12),
          const InfoField(text: 'Card Number*'),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiry Date*',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: kblack.withOpacity(0.7)),
                  ),
                  verticalSpaceTiny,
                  Container(
                    height: 44,
                    width: 166,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFD0D5DD), // Border color
                        width: 1, // Border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '00/00*',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: kblack.withOpacity(0.4)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CVV',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: kblack.withOpacity(0.7)),
                  ),
                  verticalSpaceTiny,
                  Container(
                    height: 44,
                    width: 166,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFD0D5DD), // Border color
                        width: 1, // Border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '000*',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                color: kblack.withOpacity(0.4)),
                          ),
                          verticalSpace(5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpaceSmall,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 44,
                        width: 224,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                            hintText: 'Enter Coupon Code',
                            hintStyle:
                                TextStyle(color: kblack.withOpacity(0.5)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: kblack.withOpacity(0.5), // Border color
                                width: 1, // Border width
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: kblack.withOpacity(0.5), // Border color
                                width: 1.0, // Border width
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: kblack.withOpacity(0.5), // Border color
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
                              color: kgreen), // Border color with opacity
                          borderRadius:
                              BorderRadius.circular(4), // Rounded corners
                        ),
                        child: Center(
                          child: Text(
                            'Apply', // Replace with your actual text
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter',
                              color: Colors.black
                                  .withOpacity(0.6), // Text color with opacity
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          verticalSpaceSmall,
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: kwhite,
                border: Border.all(width: 1, color: kblack.withOpacity(0.12)),
              ),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            formattedTotalPriceSum,
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
                          print('not yet bought ${viewModel.shared.bought}');

                          viewModel.addtobought();
                          print('bought  now ${viewModel.shared.bought}');

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Sucess()),
                          );
                        },
                        child: Container(
                          height: 48,
                          width: 160,
                          decoration: BoxDecoration(
                              color: kgreen,
                              borderRadius: BorderRadius.circular(4)),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }

  @override
  CheckoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CheckoutViewModel();
}
