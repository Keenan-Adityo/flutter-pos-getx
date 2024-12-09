import 'package:get/route_manager.dart';
import 'package:uas_kasir/views/cashier_view.dart';
import 'package:uas_kasir/views/dashboard_view.dart';
import 'package:uas_kasir/views/login_view.dart';

class appRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => LoginView(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => DashboardView(),
    ),
    GetPage(
      name: '/cashier',
      page: () => CashierView(),
    ),
  ];
}
