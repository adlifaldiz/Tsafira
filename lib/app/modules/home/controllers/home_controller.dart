import 'package:get/get.dart';
import 'package:tsafira/app/data/model/product_model.dart';

class HomeController extends GetxController {
  var listProduct = <ProductModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    addList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void addList() {
    listProduct.value = [
      ProductModel(1, 'Lily Dress', '199000', 'assets/images/product/product-1.png'),
      ProductModel(2, 'Gisty Top', '149000', 'assets/images/product/product-2.png'),
      ProductModel(3, 'Vanilla Dress', '199000', 'assets/images/product/product-3.png'),
      ProductModel(4, 'Sienna Basic Dress', '199000', 'assets/images/product/product-4.png'),
      ProductModel(5, 'Gisty Top', '149000', 'assets/images/product/product-2.png'),
    ];
  }
}
