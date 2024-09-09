import 'package:basketball_live_score/models/match_model.dart';
import 'package:basketball_live_score/utils/color_const.dart';
import 'package:basketball_live_score/utils/dimen_const.dart';
import 'package:basketball_live_score/views/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/match_controller.dart';
import '../../widgets/custom_text.dart';

class RankingWidget extends StatelessWidget {
  const RankingWidget({super.key, this.events});
final Events? events;
  @override
  Widget build(BuildContext context) {
    final matchController = Get.put(MatchController());

    return Obx(()=>SingleChildScrollView(
      child: matchController.isLoading.value?
        const Center(child: CustomLoading()):
        Column(

          children: [
            kSizedBoxH10,
 CustomText(text: matchController.matchDetails.value.competitionDetail?.name??"")
          ],
        )

    ));
  }
}
