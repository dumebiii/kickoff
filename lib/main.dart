import 'package:flutter/material.dart';
import 'package:kickoff/app/app.bottomsheets.dart';
import 'package:kickoff/app/app.dialogs.dart';
import 'package:kickoff/app/app.locator.dart';
import 'package:kickoff/app/app.router.dart';
import 'package:kickoff/ui/views/bottomnav.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const Bottomnav(),
      // initialRoute: Routes.naverView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
