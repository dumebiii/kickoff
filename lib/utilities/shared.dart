import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kickoff/model/product.dart';

class Shared extends ChangeNotifier {
  List<Item>? items;
  List<Item>? liked;
  List<Item> bought = [];

  void emptyCart() {
    items = [];
    notifyListeners();
  }

  String formatPrice(double price) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(price.toInt());
  }
}
