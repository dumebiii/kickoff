import 'package:intl/intl.dart';
import 'package:kickoff/app/app.locator.dart';
import 'package:kickoff/app/app.router.dart';
import 'package:kickoff/utilities/shared.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckoutViewModel extends BaseViewModel {
  final shared = locator<Shared>();
  final _navigationService = locator<NavigationService>();

  String formatPrice(double price) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(price.toInt());
  }

  void navigateCheckout() {
    _navigationService.navigateToHomeView();
  }
}
