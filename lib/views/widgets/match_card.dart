import 'package:basketball_live_score/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_const.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 1.sw * 0.10, child: CustomText(text: '19:00')),
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
                  Expanded(child: CustomText(text: 'Football')),
                  CustomText(text: '100')
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
                  Expanded(child: CustomText(text: 'Football')),
                  CustomText(text: '80')
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
