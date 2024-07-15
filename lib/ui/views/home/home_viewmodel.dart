import 'dart:async';
import 'dart:math';

import 'package:kickoff/app/app.locator.dart';
import 'package:kickoff/app/app.logger.dart';
import 'package:kickoff/app/app.router.dart';
import 'package:kickoff/model/product.dart';
import 'package:kickoff/utilities/products_api.dart';
import 'package:kickoff/utilities/shared.dart';
import 'package:stacked/stacked.dart';

import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel {
  final log = getLogger('HomeViewModel');

  final _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();
  final _shared = locator<Shared>();

  Product? _product;
  Product? get product => _product;

  Future<Product> getproductss() async {
    // try {
    Product result = await _productService.getProducts();

    _product = result;

    print(product);

    return Future.value(product);
  }

  String formatPrice(double price) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(price.toInt());
  }

  List<double> generateRatings(int itemCount) {
    Random random = Random();
    List<double> ratings = [];

    for (int i = 0; i < itemCount; i++) {
      // Generate random double between 1.0 and 5.0
      double randomRating = random.nextDouble() * 4.0 + 1.0;

      // Round to two decimal places
      ratings.add(double.parse(randomRating.toStringAsFixed(2)));
    }

    return ratings;
  }

  //CART PAGE

  List<Item> cart = [];
  bool isattractive = false;

  void addItem(Item item) {
    for (var cartItem in cart) {
      if (cartItem.id == item.id) {
        notifyListeners();
        return;
      }
    }
    cart.add(item);
    _shared.items = cart;
    notifyListeners();
  }

  void removeItem(Item item) {
    for (var cartItem in cart) {
      if (cartItem.id == item.id) {
        cart.remove(cartItem);
        _shared.items = cart;

        notifyListeners();
        return;
      }
    }
  }

  bool isInCart(Item item) {
    return cart.any((cartItem) => cartItem.id == item.id);
  }

  void toggleItemattractive() {
    isattractive = !isattractive;
    notifyListeners();
  }

  void navigateCart() {
    _navigationService.navigateToCartView();
  }

  @override
  Future futureToRun() => getproductss();
}
