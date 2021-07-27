import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tsafira/app/helper/theme.dart';

import '../controllers/detail_product_controller.dart';
import 'package:sizer/sizer.dart';

class DetailProductView extends GetView<DetailProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height * .75,
              child: Hero(
                tag: controller.imageId.toString(),
                child: Image.asset(
                  controller.image.toString(),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Obx(
              () => AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: controller.visibleCOntent.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 3.h),
                        width: Get.width,
                        height: kToolbarHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(onTap: () => Get.back(), child: Image.asset("assets/images/icon/back.png")),
                            Image.asset("assets/images/icon/check.png"),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        controller.title.value,
                        textAlign: TextAlign.left,
                        style: AppTheme.titleStyle.copyWith(
                            color: AppTheme.whiteColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 30.sp,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: AppTheme.darkGreyColor,
                                offset: Offset(5.0, 5.0),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.w),
                          topRight: Radius.circular(10.w),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, -10),
                            color: AppTheme.greyColor.withOpacity(0.3),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 3.h,
                                  decoration: BoxDecoration(
                                    color: AppTheme.accentColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(2.w), bottomLeft: Radius.circular(2.w)),
                                  ),
                                  child: GestureDetector(
                                      onTap: () => controller.incrementdown(), child: Icon(Icons.remove)),
                                ),
                                Container(
                                  height: 3.h,
                                  width: 10.w,
                                  color: AppTheme.whiteColor,
                                  child: Obx(
                                    () => Text(
                                      controller.count.toString(),
                                      textAlign: TextAlign.center,
                                      style: AppTheme.listSubTitleStyle,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 3.h,
                                  decoration: BoxDecoration(
                                    color: AppTheme.accentColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(2.w), bottomRight: Radius.circular(2.w)),
                                  ),
                                  child: GestureDetector(onTap: () => controller.incrementUp(), child: Icon(Icons.add)),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "Color",
                              style: AppTheme.listTitleStyle.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Container(
                              width: Get.width,
                              height: kToolbarHeight,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: controller.chips.map((e) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                                    child: Obx(
                                      () => ChoiceChip(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(2.w),
                                            side: BorderSide(
                                                width: 1.w,
                                                color: controller.chipValue.value == e.id
                                                    ? AppTheme.accentColor
                                                    : AppTheme.transparentColor)),
                                        label: Container(
                                          width: 10.w,
                                          height: 0.5.h,
                                        ),
                                        selected: controller.chipValue.value == e.id,
                                        selectedColor: Color(int.parse(e.color)),
                                        backgroundColor: Color(int.parse(e.color)),
                                        onSelected: (selected) {
                                          return controller.onChipSelected(selected, e.id);
                                        },
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "Size",
                              style: AppTheme.listTitleStyle.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Container(
                              width: Get.width,
                              height: kToolbarHeight,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: controller.size.map((e) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                                    child: Obx(
                                      () => ChoiceChip(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(2.w),
                                            side: BorderSide(
                                                width: 1.w,
                                                color: controller.sizeValue.value == e.id
                                                    ? AppTheme.accentColor
                                                    : AppTheme.transparentColor)),
                                        label: Text(
                                          e.name,
                                          style: TextStyle(color: AppTheme.blackColor),
                                        ),
                                        selected: controller.sizeValue.value == e.id,
                                        selectedColor: AppTheme.transparentColor,
                                        backgroundColor: AppTheme.whiteColor,
                                        onSelected: (selected) {
                                          return controller.onSizeSelected(selected, e.id);
                                        },
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
