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
    return Obx(()=>
       ((matchController.matchDetails.value.homeTeam?.statisticsForEventList!=null)&&((matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?.length??0)>2))?

       Column(
         children: [
           Divider(
             color: whiteColor,
             height: 4.h,
           ),
           Container(
             width: 1.sw,
             //margin: EdgeInsets.symmetric(horizontal: 10.w),
             padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
             decoration: BoxDecoration(
               color: grey.withOpacity(0.2),
               // borderRadius: BorderRadius.only(
               //   bottomLeft: Radius.circular(20),
               //   bottomRight: Radius.circular(20),
               //   // topRight: Radius.circular(20),
               //   // topLeft: Radius.circular(20),
               // ),
             ),
             child: CustomText(
               text: "match_stats".tr,
               fontSize: 14.sp,
               fontWeight: FontWeight.bold,
             ),
           ),
           Expanded(

               child:ListView.builder(
                   itemCount: matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?.length??0,
                   itemBuilder: (context,index){
                 return Padding(
                   padding:  EdgeInsets.only(bottom: 8.h),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       CustomText(text: matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[index].name??"",),
                       kSizedBoxH5,
                       LinearPercentIndicator(
                         barRadius: Radius.circular(10.r),
                         animation: true,
                         lineHeight: 13.h,
                         animationDuration: 100,
                         percent: (matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[index].value??0) / ((matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[index].value??0)+(matchController.matchDetails.value.awayTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[index].value??0)),
                         center: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding: EdgeInsets.only(left: 20.w),
                               child: CustomText(
                                 text: "${matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[index].value}",
                                 color: Colors.white,
                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.only(right: 20.w),
                               child: CustomText(
                                 text: "${matchController.matchDetails.value.awayTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[index].value}",
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
               })
           )
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'point'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: (matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[0].value??0) / ((matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[0].value??0)+(matchController.matchDetails.value.awayTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[0].value??0)),
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "${matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[0].value}",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "${matchController.matchDetails.value.awayTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[0].value}",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'possession'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: 50 / 100,
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "${matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[1].value}",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "${matchController.matchDetails.value.awayTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[1].value}",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'total_de_lancer'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: 50 / 100,
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "${matchController.matchDetails.value.homeTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[8].value}",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "${matchController.matchDetails.value.awayTeam?.statisticsForEventList?.teamStatistics?["${events?.id}"]?[0].statList?[8].value}",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'lancer'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: 50 / 100,
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'total_de_tir_3'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: 50 / 100,
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'tir'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: 50 / 100,
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'team_lead'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: 50 / 100,
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'time_in_lead'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: 50 / 100,
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'total_de_tir_2'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: 50 / 100,
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
           // Column(
           //   crossAxisAlignment: CrossAxisAlignment.center,
           //   children: [
           //     CustomText(text: 'tir_2_point'.tr),
           //     kSizedBoxH5,
           //     LinearPercentIndicator(
           //       barRadius: Radius.circular(10.r),
           //       animation: true,
           //       lineHeight: 13.h,
           //       animationDuration: 100,
           //       percent: 50 / 100,
           //       center: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Padding(
           //             padding: EdgeInsets.only(left: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //           Padding(
           //             padding: EdgeInsets.only(right: 20.w),
           //             child: CustomText(
           //               text: "%",
           //               color: Colors.white,
           //             ),
           //           ),
           //         ],
           //       ),
           //       linearStrokeCap: LinearStrokeCap.roundAll,
           //       progressColor: Colors.green,
           //       backgroundColor: Colors.blueGrey,
           //     ),
           //   ],
           // ),
           // kSizedBoxH15,
         ],
       ): Center(child: CustomText(text: "no_data".tr)),
    );
  }
}
