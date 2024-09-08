import 'package:basketball_live_score/controller/match_controller.dart';
import 'package:basketball_live_score/utils/color_const.dart';
import 'package:basketball_live_score/utils/dimen_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/custom_loading.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/match_card.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matchController = Get.put(MatchController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Obx(
          () => CustomText(
            text: "${'matches'.tr} - ${matchController.date}",
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // Get.to(() => const SearchScreen(), arguments: {
              //   'matches': matchController.matches,
              // });
            },
            icon: Icon(
              Icons.search,
              color: secondaryColor,
            ),
          ),
          IconButton(
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: matchController.selectedDate.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (picked != null &&
                  picked != matchController.selectedDate.value) {
                matchController.setDate(picked);
              }
            },
            icon: Icon(
              Icons.calendar_month,
              color: secondaryColor,
            ),
          ),
        ],
      ),
      body: Obx(
        () => matchController.isLoading.value
            ? const Center(
                child: CustomLoading(),
              )
            : matchController.matches.isEmpty
                ? Center(
                    child: CustomText(text: 'no_data'.tr),
                  )
                : Padding(
                    padding: EdgeInsets.all(5.w),
                    child: ListView.builder(
                        itemCount: matchController.matches.length,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            padding: 0.w,
                            widget: ExpansionTile(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r)),
                              collapsedBackgroundColor: Colors.white,
                              collapsedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r)),
                              childrenPadding: EdgeInsets.all(10.w),
                              leading: Icon(
                                Icons.sports_basketball,
                                size: 18.sp,
                                color: secondaryColor,
                              ),
                              title: CustomText(
                                text:
                                    "${matchController.matches[index].season?.competition?.country?.name ?? ''} - ${matchController.matches[index].season?.competition?.name ?? ''}",
                                maxLines: 2,
                              ),
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: matchController
                                        .matches[index].events?.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index1) {
                                      return Column(
                                        children: [
                                          kSizedBoxH5,
                                          MatchCard(
                                            events: matchController
                                                .matches[index].events?[index1],
                                          ),
                                          kSizedBoxH5,
                                          Visibility(
                                            visible: index1 !=
                                                (matchController.matches[index]
                                                            .events?.length ??
                                                        1) -
                                                    1,
                                            child: Divider(
                                                height: 1.h,
                                                color: grey.withOpacity(0.3)),
                                          ),
                                        ],
                                      );
                                    })
                              ],
                            ),
                          );
                        }),
                  ),
      ),
    );
  }
}
