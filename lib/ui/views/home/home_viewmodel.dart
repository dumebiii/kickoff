import 'dart:async';

import 'package:kickoff/app/app.locator.dart';
import 'package:kickoff/app/app.logger.dart';
import 'package:kickoff/model/product.dart';
import 'package:kickoff/utilities/products_api.dart';
import 'package:stacked/stacked.dart';

import 'package:intl/intl.dart';

class HomeViewModel extends FutureViewModel {
  final log = getLogger('HomeViewModel');

  final _productService = locator<ProductService>();

  Product? _product;
  Product get product => _product!;

  Future<Product> getproductss() async {
    // try {
    Product result = await _productService.getProducts();

    _product = result;
    print(product);

    return Future.value(_product);
  }

  String formatPrice(double price) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(price.toInt());
  }

  @override
  Future futureToRun() => getproductss();
}
