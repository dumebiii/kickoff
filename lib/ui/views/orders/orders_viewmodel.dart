import 'package:intl/intl.dart';
import 'package:kickoff/app/app.locator.dart';
import 'package:kickoff/utilities/shared.dart';
import 'package:stacked/stacked.dart';

class OrdersViewModel extends BaseViewModel {
  final shared = locator<Shared>();

  String formatPrice(double price) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(price.toInt());
  }
}
