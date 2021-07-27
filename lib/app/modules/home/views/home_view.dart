import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:tsafira/app/helper/intl_formats.dart';
import 'package:tsafira/app/helper/theme.dart';
import 'package:tsafira/app/routes/app_pages.dart';
import 'package:tsafira/app/widget/custom_text_field.dart';

import '../controllers/home_controller.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 3.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Find the best\nclothes for you',
                        style: AppTheme.titleStyle.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                        maxRadius: 6.w,
                        backgroundColor: AppTheme.accentColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            size: 20.sp,
                            color: AppTheme.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  useObscure: false,
                  prefixIcon: Icon(Icons.search_rounded),
                  hintText: 'Search',
                ),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    primary: false,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.h,
                    crossAxisSpacing: 5.w,
                    itemCount: controller.listProduct.length,
                    itemBuilder: (context, index) {
                      final data = controller.listProduct[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.DETAIL_PRODUCT, arguments: data.id),
                        child: Column(
                          children: [
                            Hero(
                              tag: data.id.toString(),
                              child: Image.asset('${data.image}'),
                            ),
                            Text(
                              data.name.toString(),
                              style: AppTheme.listTitleStyle,
                            ),
                            Text(
                              formatCurrency(double.parse(data.price.toString())),
                              style: AppTheme.listSubTitleStyle,
                            ),
                          ],
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
