import 'package:basketball_live_score/utils/dimen_const.dart';
import 'package:basketball_live_score/utils/function.dart';
import 'package:basketball_live_score/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/match_model.dart';
import '../../utils/color_const.dart';

class MatchCard extends StatelessWidget {
  final Events? events;
  const MatchCard({super.key, this.events});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
      },
      child: Row(
        children: [
          SizedBox(
              width: 1.sw * 0.10,
              child: events?.state == 1
                  ? CustomText(text: getTime(events?.date ?? 0))
                  : events?.state == 2
                      ? Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: secondaryColor,
                              size: 10.sp,
                            ),
                            kSizedBoxW5,
                            events?.liveTimeRemaining != null
                                ? CustomText(
                                    text: "Q${events?.period ?? ''}",
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  )
                                : CustomText(
                                    text: 'HT',
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  )
                          ],
                        )
                      : events?.state == 3
                          ? const CustomText(text: 'End')
                          : events?.state == 4
                              ? const CustomText(text: 'PP')
                              : const CustomText(text: '')),
          Expanded(
            child: Column(
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
                    Expanded(
                        child: CustomText(
                      text: events?.homeTeam?.name ?? '',
                      fontWeight: events?.state == 3
                          ? (events?.scores?.seven?.home ?? 0) >
                                  (events?.scores?.seven?.away ?? 0)
                              ? FontWeight.bold
                              : FontWeight.normal
                          : FontWeight.normal,
                    )),
                    CustomText(
                      text: "${events?.scores?.seven?.home ?? '-'}",
                      fontWeight: events?.state == 3
                          ? (events?.scores?.seven?.home ?? 0) >
                                  (events?.scores?.seven?.away ?? 0)
                              ? FontWeight.bold
                              : FontWeight.normal
                          : FontWeight.normal,
                    )
                  ],
                ),
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
                    Expanded(
                      child: CustomText(
                        text: events?.awayTeam?.name ?? '',
                        fontWeight: events?.state == 3
                            ? (events?.scores?.seven?.away ?? 0) >
                                    (events?.scores?.seven?.home ?? 0)
                                ? FontWeight.bold
                                : FontWeight.normal
                            : FontWeight.normal,
                      ),
                    ),
                    CustomText(
                      text: "${events?.scores?.seven?.away ?? '-'}",
                      fontWeight: events?.state == 3
                          ? (events?.scores?.seven?.away ?? 0) >
                                  (events?.scores?.seven?.home ?? 0)
                              ? FontWeight.bold
                              : FontWeight.normal
                          : FontWeight.normal,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
