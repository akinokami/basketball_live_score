import 'package:basketball_live_score/utils/dimen_const.dart';
import 'package:basketball_live_score/views/widgets/custom_card.dart';
import 'package:basketball_live_score/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/player_model.dart';
import '../../../utils/color_const.dart';

class PlayerWidget extends StatelessWidget {
  final PlayerModel? player;
  const PlayerWidget({super.key, this.player});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomCard(
          widget: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomText(text: 'average_age'.tr),
                          CustomText(text: "${player?.averageAge ?? '-'}")
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: grey.withOpacity(0.3),
                      width: 1.w,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CustomText(text: 'average_height'.tr),
                          CustomText(text: "${player?.averageHeight ?? '-'}")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              kSizedBoxH5,
              Divider(height: 1.h, color: grey.withOpacity(0.3)),
              kSizedBoxH5,
              CustomText(text: 'average_weight'.tr),
              CustomText(text: "${player?.averageWeight ?? '-'}")
            ],
          ),
        ),
        CustomCard(
            widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'players'.tr),
            kSizedBoxH5,
            Divider(height: 1.h, color: grey.withOpacity(0.3)),
            kSizedBoxH5,
            ListView.builder(
                shrinkWrap: true,
                itemCount: player?.playerList?.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
                    child: Row(
                      children: [
                        Container(
                          width: 25.w,
                          height: 25.w,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(100.r)),
                          alignment: Alignment.center,
                          child: CustomText(
                            text: "${player?.playerList?[index].number ?? '-'}",
                            color: Colors.white,
                          ),
                        ),
                        kSizedBoxW10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: player
                                        ?.playerList?[index].player?.fullName ??
                                    ''),
                            CustomText(
                              text: player?.playerList?[index].player?.country
                                      ?.name ??
                                  '-',
                              fontSize: 11.sp,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                })
          ],
        ))
      ],
    );
  }
}
