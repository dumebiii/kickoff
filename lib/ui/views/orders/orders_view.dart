import 'package:flutter/material.dart';
import 'package:kickoff/ui/common/app_colors.dart';
import 'package:kickoff/ui/common/app_strings.dart';
import 'package:kickoff/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'orders_viewmodel.dart';

class OrdersView extends StackedView<OrdersViewModel> {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrdersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: viewModel.shared.bought != null
            ? SafeArea(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
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
                                'Order History',
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
                            'Bought Items',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),
                          ),
                          verticalSpaceSmall,
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.52,
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount: viewModel.shared.bought!.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 44,
                                        width: 44,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Image.network(
                                          "$kimg/${viewModel.shared.bought![index].photos.first.url}?organization_id=$korganizationID&Appid=$kappID&Apikey=$kApiKey",
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
                                                  .shared.bought![index].name,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "₦${viewModel.formatPrice(viewModel.shared.bought![index].currentPrice.first.prices['NGN'][0])}",
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
                                                    color:
                                                        kblack.withOpacity(0.6),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Inter',
                                                  ),
                                                ),
                                                Text(
                                                  "X1",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color:
                                                        kblack.withOpacity(0.6),
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
                          )
                        ])))
            : SafeArea(
                child: Center(
                  child: Text(
                    "No Items bought yet",
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
  OrdersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrdersViewModel();
}
