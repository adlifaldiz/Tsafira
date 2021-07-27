import 'package:get/get.dart';
import 'package:tsafira/app/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  var visibleLogo = false.obs;

  @override
  void onInit() async {
    await onVisibleLogo();
    await onSplash();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future onVisibleLogo() async {
    await Future.delayed(Duration(milliseconds: 300));
    visibleLogo(true);
  }

  Future onSplash() async {
    Future.delayed(Duration(seconds: 5)).then((value) => Get.toNamed(Routes.HOME));
  }
}
