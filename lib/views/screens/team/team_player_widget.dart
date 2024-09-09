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
    return Column(
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
                          CustomText(text: '20')
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
                          CustomText(text: '20')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              kSizedBoxH5,
              Divider(height: 1.h, color: grey.withOpacity(0.3)),
              kSizedBoxH5,
              CustomText(text: 'average_age'.tr),
              CustomText(text: '20')
            ],
          ),
        ),
        CustomCard(
            widget: Column(
          children: [],
        ))
      ],
    );
  }
}
