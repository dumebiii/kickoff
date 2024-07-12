import 'package:kickoff/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:kickoff/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:kickoff/ui/views/home/home_view.dart';
import 'package:kickoff/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:kickoff/ui/views/cart/cart_view.dart';
import 'package:kickoff/ui/views/checkout/checkout_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: CheckoutView),
// @stacked-route
  ],
  logger: StackedLogger(),
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
