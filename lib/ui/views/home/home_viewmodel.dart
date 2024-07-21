import 'dart:async';
import 'dart:math';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:kickoff/app/app.locator.dart';
import 'package:kickoff/app/app.logger.dart';
import 'package:kickoff/app/app.router.dart';
import 'package:kickoff/model/product.dart';
import 'package:kickoff/utilities/products_api.dart';
import 'package:kickoff/utilities/shared.dart';

import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ChangeNotifier {
  final log = getLogger('HomeViewModel');

  final _productService = locator<ProductService>();
  final _navigationService = locator<NavigationService>();
  final shared = locator<Shared>();

  Product? savedproduct;

  Product? _product;

  Future<Product?> getproductss() async {
    // try {

    Product result = await _productService.getProducts();

    _product = result;

    return _product;
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
    shared.items = cart;
    notifyListeners();
  }

  void removeItem(Item item) {
    for (var cartItem in cart) {
      if (cartItem.id == item.id) {
        cart.remove(cartItem);
        shared.items = cart;

        notifyListeners();
        return;
      }
    }
  }

  bool isInCart(Item item) {
    return cart.any((cartItem) => cartItem.id == item.id);
  }

  //CART PAGE

  List<Item> liked = [];
  // bool isattractive = false;

  void addLikedItem(Item item) {
    for (var likedItem in liked) {
      if (likedItem.id == item.id) {
        notifyListeners();
        return;
      }
    }
    liked.add(item);
    shared.liked = liked;
    notifyListeners();
  }

  void removeLikedItem(Item item) {
    for (var cartItem in liked) {
      if (cartItem.id == item.id) {
        liked.remove(cartItem);
        shared.liked = liked;

        notifyListeners();
        return;
      }
    }
  }

  bool isInLiked(Item item) {
    return liked.any((likedItem) => likedItem.id == item.id);
  }

  // void toggleItemattractive() {
  //   isattractive = !isattractive;
  //   notifyListeners();
  // }

  void navigateCart() {
    _navigationService.navigateToCartView();
  }

  void navigateOrders() {
    _navigationService.navigateToOrdersView();
  }
}
