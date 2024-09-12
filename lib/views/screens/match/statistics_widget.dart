import 'package:basketball_live_score/models/match_model.dart';
import 'package:basketball_live_score/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../controller/match_controller.dart';
import '../../../utils/dimen_const.dart';
import '../../widgets/custom_text.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key, this.events});
  final Events? events;
  @override
  Widget build(BuildContext context) {
    final matchController = Get.put(MatchController());
    print("${events?.homeTeam?.id} Home Team ID");
    return Obx(
      () => ((matchController
                      .matchDetails.value.homeTeam?.statisticsForEventList !=
                  null) &&
              ((matchController
                          .matchDetails
                          .value
                          .homeTeam
                          ?.statisticsForEventList
                          ?.teamStatistics?["${events?.id}"]?[0]
                          .statList
                          ?.length ??
                      0) >
                  2))
          ? Column(
              children: [
                Divider(
                  color: whiteColor,
                  height: 4.h,
                ),
                Container(
                  width: 1.sw,
                  padding:
                      EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: grey.withOpacity(0.2),
                  ),
                  child: CustomText(
                    text: "match_stats".tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: matchController
                                .matchDetails
                                .value
                                .homeTeam
                                ?.statisticsForEventList
                                ?.teamStatistics?["${events?.id}"]?[0]
                                .statList
                                ?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: matchController
                                          .matchDetails
                                          .value
                                          .homeTeam
                                          ?.statisticsForEventList
                                          ?.teamStatistics?["${events?.id}"]?[0]
                                          .statList?[index]
                                          .name ??
                                      "",
                                ),
                                kSizedBoxH5,
                                LinearPercentIndicator(
                                  barRadius: Radius.circular(10.r),
                                  animation: true,
                                  lineHeight: 13.h,
                                  animationDuration: 100,
                                  percent: (matchController
                                              .matchDetails
                                              .value
                                              .homeTeam
                                              ?.statisticsForEventList
                                              ?.teamStatistics?["${events?.id}"]
                                                  ?[0]
                                              .statList?[index]
                                              .value ??
                                          0) /
                                      ((matchController
                                                  .matchDetails
                                                  .value
                                                  .homeTeam
                                                  ?.statisticsForEventList
                                                  ?.teamStatistics?[
                                                      "${events?.id}"]?[0]
                                                  .statList?[index]
                                                  .value ??
                                              0) +
                                          (matchController
                                                  .matchDetails
                                                  .value
                                                  .awayTeam
                                                  ?.statisticsForEventList
                                                  ?.teamStatistics?[
                                                      "${events?.id}"]?[0]
                                                  .statList?[index]
                                                  .value ??
                                              0)),
                                  center: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.w),
                                        child: CustomText(
                                          text:
                                              "${matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[index].value}",
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20.w),
                                        child: CustomText(
                                          text:
                                              "${matchController.matchDetails.value.awayTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[index].value}",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),

                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.green,
                                  backgroundColor: Colors.blueGrey,
                                ),
                              ],
                            ),
                          );
                        }))
              ],
            )
          : Center(child: CustomText(text: "no_data".tr)),
    );
  }
}
