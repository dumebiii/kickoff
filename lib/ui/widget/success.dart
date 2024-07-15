import 'package:flutter/material.dart';
import 'package:kickoff/app/app.locator.dart';
import 'package:kickoff/app/app.router.dart';
import 'package:kickoff/utilities/shared.dart';
import 'package:stacked_services/stacked_services.dart';

class Sucess extends StatelessWidget {
  const Sucess({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationService = locator<NavigationService>();
    final shared = locator<Shared>();

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: GestureDetector(
          onTap: () {
            navigationService.replaceWithNaverView();
            shared.emptyCart();
          },
          child:
              Image.asset(height: 400, width: 400, 'assets/images/success.png'),
        ),
      )),
    );
  }
}
