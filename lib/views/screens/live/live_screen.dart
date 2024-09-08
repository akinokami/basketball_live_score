import 'package:basketball_live_score/views/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/live_controller.dart';
import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/match_card.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final liveController = Get.put(LiveController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: CustomText(
          text: 'live'.tr,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
        () => liveController.isLoading.value
            ? const Center(
                child: CustomLoading(),
              )
            : liveController.lives.isEmpty
                ? Center(
                    child: CustomText(text: 'no_live'.tr),
                  )
                : Padding(
                    padding: EdgeInsets.all(5.w),
                    child: ListView.builder(
                        itemCount: liveController.lives.length,
                        itemBuilder: (context, index) {
                          return CustomCard(
                              widget: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.sports_basketball,
                                    size: 18.sp,
                                    color: secondaryColor,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  CustomText(
                                    text:
                                        "${liveController.lives[index].season?.competition?.country?.name ?? ''} - ${liveController.lives[index].season?.competition?.name ?? ''}",
                                  )
                                ],
                              ),
                              kSizedBoxH5,
                              Divider(
                                  height: 1.h, color: grey.withOpacity(0.3)),
                              kSizedBoxH5,
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    liveController.lives[index].events?.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index1) {
                                  return Visibility(
                                    visible: liveController.lives[index]
                                            .events?[index1].state ==
                                        2,
                                    child: Column(
                                      children: [
                                        kSizedBoxH5,
                                        MatchCard(
                                          events: liveController
                                              .lives[index].events?[index1],
                                        ),
                                        kSizedBoxH5,
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ));
                        })),
      ),
    );
  }
}
