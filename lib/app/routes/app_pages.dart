import 'package:get/get.dart';

import 'package:tsafira/app/modules/detail_product/bindings/detail_product_binding.dart';
import 'package:tsafira/app/modules/detail_product/views/detail_product_view.dart';
import 'package:tsafira/app/modules/home/bindings/home_binding.dart';
import 'package:tsafira/app/modules/home/views/home_view.dart';
import 'package:tsafira/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:tsafira/app/modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => DetailProductView(),
      binding: DetailProductBinding(),
    ),
  ];
}
