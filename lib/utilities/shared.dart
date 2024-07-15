import 'package:flutter/material.dart';
import 'package:kickoff/model/product.dart';

class Shared extends ChangeNotifier {
  List<Item>? items;

  void emptyCart() {
    items = [];
    notifyListeners();
  }
}
