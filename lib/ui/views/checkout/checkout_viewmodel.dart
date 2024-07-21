import 'package:intl/intl.dart';
import 'package:kickoff/app/app.locator.dart';
import 'package:kickoff/app/app.router.dart';
import 'package:kickoff/model/product.dart';
import 'package:kickoff/utilities/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckoutViewModel extends BaseViewModel {
  final shared = locator<Shared>();
  final _navigationService = locator<NavigationService>();

  String formatPrice(double price) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(price.toInt());
  }

  List<String> states = [
    'Abia',
    'Adamawa',
    'Akwa Ibom',
    'Anambra',
    'Bauchi',
    'Bayelsa',
    'Benue',
    'Borno',
    'Cross River',
    'Delta',
    'Ebonyi',
    'Edo',
    'Ekiti',
    'Enugu',
    'Gombe',
    'Imo',
    'Jigawa',
    'Kaduna',
    'Kano',
    'Katsina',
    'Kebbi',
    'Kogi',
    'Kwara',
    'Lagos',
    'Nasarawa',
    'Niger',
    'Ogun',
    'Ondo',
    'Osun',
    'Oyo',
    'Plateau',
    'Rivers',
    'Sokoto',
    'Taraba',
    'Yobe',
    'Zamfara'
  ];
  void addtobought() {
    print('OMOOOO  now ${shared.items}');

    if (shared.items != null) {
      print('OMOOOO  now NOW ${shared.items}');

      shared.items;
      shared.bought.addAll(shared.items!);
      notifyListeners();
    }
  }

  void navigateCheckout() {
    _navigationService.navigateToHomeView();
  }
}
