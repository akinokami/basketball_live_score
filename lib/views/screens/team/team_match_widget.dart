import 'package:basketball_live_score/views/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/team_model.dart';
import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';
import '../../../utils/function.dart';
import '../../widgets/custom_text.dart';

class TeamMatchWidget extends StatelessWidget {
  final TeamModel? team;
  const TeamMatchWidget({super.key, this.team});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: team?.events?.length,
        itemBuilder: (context, index) {
          CompetitionsDetailList? c = (team?.competitionsDetailList ?? [])
              .where((element) =>
                  element.id == team?.events?[index].competitionDetail?.id)
              .firstOrNull;
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
                        "${c?.season?.competition?.country?.name ?? ''} - ${c?.season?.competition?.name ?? ''}",
                  )
                ],
              ),
              kSizedBoxH5,
              Divider(height: 1.h, color: grey.withOpacity(0.3)),
              kSizedBoxH5,
              Column(
                children: [
                  kSizedBoxH5,
                  Row(
                    children: [
                      SizedBox(
                          width: 1.sw * 0.10,
                          child: team?.events?[index].state == 1
                              ? CustomText(
                                  text: getTime(team?.events?[index].date ?? 0))
                              : team?.events?[index].state == 2
                                  ? Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: secondaryColor,
                                          size: 10.sp,
                                        ),
                                        kSizedBoxW5,
                                        team?.events?[index]
                                                    .liveTimeRemaining !=
                                                null
                                            ? CustomText(
                                                text: (team?.events?[index]
                                                                .period ??
                                                            0) >
                                                        3
                                                    ? "Q${((team?.events?[index].period ?? 0) - 1)}"
                                                    : "Q${team?.events?[index].period ?? ''}",
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
                                  : team?.events?[index].state == 3
                                      ? const CustomText(text: 'End')
                                      : team?.events?[index].state == 4
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
                                  text: team?.events?[index].homeTeam?.name ??
                                      team?.team?.name ??
                                      '',
                                  fontWeight: team?.events?[index].state == 3
                                      ? (team?.events?[index].scores?.seven
                                                      ?.home ??
                                                  0) >
                                              (team?.events?[index].scores
                                                      ?.seven?.away ??
                                                  0)
                                          ? FontWeight.bold
                                          : FontWeight.normal
                                      : FontWeight.normal,
                                )),
                                CustomText(
                                  text:
                                      "${team?.events?[index].scores?.seven?.home ?? '-'}",
                                  fontWeight: team?.events?[index].state == 3
                                      ? (team?.events?[index].scores?.seven
                                                      ?.home ??
                                                  0) >
                                              (team?.events?[index].scores
                                                      ?.seven?.away ??
                                                  0)
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
                                    text: team?.events?[index].awayTeam?.name ??
                                        team?.team?.name ??
                                        '',
                                    fontWeight: team?.events?[index].state == 3
                                        ? (team?.events?[index].scores?.seven
                                                        ?.away ??
                                                    0) >
                                                (team?.events?[index].scores
                                                        ?.seven?.home ??
                                                    0)
                                            ? FontWeight.bold
                                            : FontWeight.normal
                                        : FontWeight.normal,
                                  ),
                                ),
                                CustomText(
                                  text:
                                      "${team?.events?[index].scores?.seven?.away ?? '-'}",
                                  fontWeight: team?.events?[index].state == 3
                                      ? (team?.events?[index].scores?.seven
                                                      ?.away ??
                                                  0) >
                                              (team?.events?[index].scores
                                                      ?.seven?.home ??
                                                  0)
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
                  kSizedBoxH5,
                ],
              ),
            ],
          ));
        });
  }
}
