import 'package:kickoff/model/product.dart';

abstract class Products {
  Future<Product> getProducts();
}
