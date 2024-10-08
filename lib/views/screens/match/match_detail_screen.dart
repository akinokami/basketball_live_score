import 'package:basketball_live_score/models/match_model.dart';
import 'package:basketball_live_score/utils/color_const.dart';
import 'package:basketball_live_score/utils/dimen_const.dart';
import 'package:basketball_live_score/views/screens/match/ranking_widget.dart';
import 'package:basketball_live_score/views/screens/match/statistics_widget.dart';
import 'package:basketball_live_score/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/function.dart';
import '../team/team_screen.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({super.key, this.events, this.matchTitle});
  final Events? events;
  final String? matchTitle;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: secondaryColor,
            centerTitle: true,
            title: CustomText(
                text: matchTitle ?? '',
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(20.r),
                  //   bottomRight: Radius.circular(20.r),
                  // ),
                ),
                child: Column(
                  children: [
                    kSizedBoxH15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const TeamScreen(),
                                arguments: {'teamId': events?.homeTeam?.id});
                          },
                          child: SizedBox(
                            width: 100.w,
                            height: 70.h,
                            child: Column(
                              children: [
                                Icon(Icons.sports_basketball,
                                    color: Colors.white, size: 20.sp),
                                kSizedBoxH10,
                                CustomText(
                                  maxLines: 3,
                                  text: events?.homeTeam?.name ?? '',
                                  color: Colors.white,
                                  textAlign: TextAlign.center,
                                  fontSize: 10.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100.w,
                          height: 70.h,
                          child: Column(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.white, size: 20.sp),
                              kSizedBoxH10,
                              (events?.scores?.seven?.home != null)
                                  ? CustomText(
                                      text:
                                          "${events?.scores?.seven?.home ?? ''} - ${events?.scores?.seven?.away ?? ''}",
                                      color: Colors.white,
                                    )
                                  : CustomText(
                                      text: "soon".tr,
                                      color: Colors.white,
                                    ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const TeamScreen(),
                                arguments: {'teamId': events?.awayTeam?.id});
                          },
                          child: SizedBox(
                            width: 100.w,
                            height: 70.h,
                            child: Column(
                              children: [
                                Icon(Icons.sports_basketball,
                                    color: Colors.white, size: 20.sp),
                                kSizedBoxH10,
                                CustomText(
                                  maxLines: 3,
                                  text: events?.awayTeam?.name ?? '',
                                  color: Colors.white,
                                  textAlign: TextAlign.center,
                                  fontSize: 10.sp,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    kSizedBoxH10,
                    SizedBox(
                        width: 1.sw * 0.10,
                        child: events?.state == 1
                            ? CustomText(
                                text: getTime(events?.date ?? 0),
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              )
                            : events?.state == 2
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: whiteColor,
                                        size: 10.sp,
                                      ),
                                      kSizedBoxW5,
                                      events?.liveTimeRemaining != null
                                          ? CustomText(
                                              text: (events?.period ?? 0) > 3
                                                  ? "Q${((events?.period ?? 0) - 1)}"
                                                  : "Q${events?.period ?? ''}",
                                              color: whiteColor,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.center,
                                              fontSize: 14.sp)
                                          : CustomText(
                                              text: 'HT',
                                              color: whiteColor,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.center,
                                              fontSize: 14.sp)
                                    ],
                                  )
                                : events?.state == 3
                                    ? CustomText(
                                        text: 'End',
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold,
                                        textAlign: TextAlign.center,
                                        fontSize: 14.sp)
                                    : events?.state == 4
                                        ? CustomText(
                                            text: 'PP',
                                            color: whiteColor,
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                            fontSize: 14.sp)
                                        : CustomText(
                                            text: '',
                                            color: whiteColor,
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                            fontSize: 14.sp)),
                    kSizedBoxH15,
                    Divider(
                      height: 2.h,
                      color: whiteColor.withOpacity(0.3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(20.r),
                        //   bottomRight: Radius.circular(20.r),
                        // ),
                      ),
                      padding: EdgeInsets.all(8.w),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              // color: secondaryColor,
                              border: Border(
                                top: BorderSide(color: whiteColor, width: 1.h),
                                //bottom: BorderSide(color: whiteColor, width: 1.h),
                                left: BorderSide(color: whiteColor, width: 1.h),
                                right:
                                    BorderSide(color: whiteColor, width: 1.h),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: CustomText(
                                    text: "",
                                    color: whiteColor,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText(
                                        text: "Q1",
                                        color: whiteColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      CustomText(
                                          text: "Q2",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text: "HT",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text: "Q3",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text: "Q4",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text: "FT",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          // kSizedBoxH2,
                          // Divider(
                          //   height: 2.h,
                          //   color: whiteColor.withOpacity(0.3),
                          // ),
                          //kSizedBoxH2,
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              // color: secondaryColor,
                              border: Border(
                                top: BorderSide(color: whiteColor, width: 1.h),
                                bottom:
                                    BorderSide(color: whiteColor, width: 1.h),
                                left: BorderSide(color: whiteColor, width: 1.h),
                                right:
                                    BorderSide(color: whiteColor, width: 1.h),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: CustomText(
                                    text: "${events?.homeTeam?.name}",
                                    color: whiteColor,
                                    maxLines: 2,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText(
                                          text:
                                              "${events?.scores?.one?.home ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${events?.scores?.two?.home ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${((events?.scores?.one?.home)?.toInt() ?? 0) + ((events?.scores?.two?.home)?.toInt() ?? 0)}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${events?.scores?.four?.home ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${events?.scores?.five?.home ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${events?.scores?.seven?.home ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              // color: secondaryColor,
                              border: Border(
                                //top: BorderSide(color: whiteColor, width: 1.h),
                                bottom:
                                    BorderSide(color: whiteColor, width: 1.h),
                                left: BorderSide(color: whiteColor, width: 1.h),
                                right:
                                    BorderSide(color: whiteColor, width: 1.h),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: CustomText(
                                    text: "${events?.awayTeam?.name}",
                                    color: whiteColor,
                                    maxLines: 2,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText(
                                          text:
                                              "${events?.scores?.one?.away ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${events?.scores?.two?.away ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${((events?.scores?.one?.away)?.toInt() ?? 0) + ((events?.scores?.two?.away)?.toInt() ?? 0)}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${events?.scores?.four?.away ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${events?.scores?.five?.away ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                      CustomText(
                                          text:
                                              "${events?.scores?.seven?.away ?? "0"}",
                                          color: whiteColor,
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          kSizedBoxH5,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kSizedBoxH5,
              Container(
                padding: EdgeInsets.all(2.w),
                margin: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(color: secondaryColor, width: 1.h),
                    bottom: BorderSide(color: secondaryColor, width: 1.h),
                    left: BorderSide(color: secondaryColor, width: 1.h),
                    right: BorderSide(color: secondaryColor, width: 1.h),
                  ),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: TabBar(
                  //dividerColor: secondaryColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: secondaryColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: whiteColor,
                  unselectedLabelColor: greyColor,
                  labelColor: whiteColor,

                  //indicatorWeight: 5.h,
                  tabs: [
                    Tab(
                      text: 'stats'.tr,
                    ),
                    Tab(
                      text: 'ranking'.tr,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    StatisticsWidget(
                      events: events,
                    ),
                    RankingWidget(
                      events: events,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
