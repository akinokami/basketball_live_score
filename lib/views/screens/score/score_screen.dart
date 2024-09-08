import 'package:basketball_live_score/utils/color_const.dart';
import 'package:basketball_live_score/utils/dimen_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/match_card.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: CustomText(
          text: 'score'.tr,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Padding(
            padding: EdgeInsets.all(5.w),
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return CustomCard(
                    padding: 0.w,
                    widget: ExpansionTile(
                      leading: Icon(
                        Icons.sports_basketball,
                        size: 18.sp,
                        color: secondaryColor,
                      ),
                      title: const CustomText(text: 'NBA'),
                      children: [
                        MatchCard(),
                        MatchCard(),
                      ],
                    ),
                  );
                  // Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Icon(
                  //           Icons.sports_basketball,
                  //           size: 18.sp,
                  //           color: secondaryColor,
                  //         ),
                  //         SizedBox(
                  //           width: 10.w,
                  //         ),
                  //         CustomText(text: 'NBA')
                  //       ],
                  //     ),
                  //     kSizedBoxH5,
                  //     Divider(height: 1.h, color: grey.withOpacity(0.3)),
                  //     kSizedBoxH5,
                  //     MatchCard(),
                  //   ],
                  // ),
                })),
      ),
    );
  }
}
