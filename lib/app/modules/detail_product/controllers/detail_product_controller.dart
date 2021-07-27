import 'package:get/get.dart';
import 'package:tsafira/app/data/model/chips_model.dart';
import 'package:tsafira/app/modules/home/controllers/home_controller.dart';

class DetailProductController extends GetxController {
  var productController = Get.find<HomeController>();
  var image = ''.obs;
  var title = ''.obs;
  final count = 1.obs;
  var imageId;
  var chipValue = 0.obs;
  var sizeValue = 0.obs;
  var visibleCOntent = false.obs;

  List<ChipsModel> chips = <ChipsModel>[
    ChipsModel(0, 'White', '0xffffffff'),
    ChipsModel(1, 'Brownie', '0xffCCAD5D'),
    ChipsModel(2, 'Black', '0xff000000'),
  ];
  var size = <ChipsModel>[
    ChipsModel(0, 'Small', ''),
    ChipsModel(1, 'M Fit to L', ''),
    ChipsModel(2, 'Plus Size', ''),
  ];

  @override
  void onInit() async {
    imageId = Get.arguments;
    image.value =
        productController.listProduct.where((itemProduct) => itemProduct.id == imageId).single.image.toString();
    title.value =
        productController.listProduct.where((itemProduct) => itemProduct.id == imageId).single.name.toString();
    await Future.delayed(Duration(milliseconds: 300));
    visibleCOntent(true);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void incrementUp() => count.value++;

  num incrementdown() {
    if (count.value == 1) {
      return 1;
    }
    return count.value--;
  }

  void onChipSelected(bool selected, id) {
    chipValue.value = id;
    update();
  }

  void onSizeSelected(bool selected, id) {
    sizeValue.value = id;
    update();
  }
}
