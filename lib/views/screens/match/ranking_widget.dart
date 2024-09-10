import 'package:basketball_live_score/models/match_model.dart';
import 'package:basketball_live_score/utils/color_const.dart';
import 'package:basketball_live_score/utils/dimen_const.dart';
import 'package:basketball_live_score/views/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/match_controller.dart';
import '../../widgets/custom_text.dart';

class RankingWidget extends StatelessWidget {
  const RankingWidget({super.key, this.events});
final Events? events;
  @override
  Widget build(BuildContext context) {
    final matchController = Get.put(MatchController());

    return SingleChildScrollView(
      child:
        Column(

          children: [
            kSizedBoxH10,
            Table(

              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: secondaryColor
                  ) ,
                  children: [
                    TableCell(child: CustomText(text:'',color: whiteColor,textAlign: TextAlign.center)),
                    TableCell(child: CustomText(text:'Team',color: whiteColor,textAlign: TextAlign.center)),
                    TableCell(child: CustomText(text:'',color: whiteColor,textAlign: TextAlign.center)),
                    TableCell(child: CustomText(text:'%',color: whiteColor,textAlign: TextAlign.center)),
                    TableCell(child: CustomText(text:'P',color: whiteColor,textAlign: TextAlign.center)),
                    TableCell(child: CustomText(text:'W',color: whiteColor,textAlign: TextAlign.center)),
                    TableCell(child: CustomText(text:'L',color: whiteColor,textAlign: TextAlign.center)),
                    TableCell(child: CustomText(text:'Str',color: whiteColor,textAlign: TextAlign.center)),
                  ]
                ),
                for (var i = 0; i < (matchController.matchDetails.value.competitionDetail?.rankingCompetition?.rankingList?.general?.length??0); i++)
                  TableRow(
                    decoration: BoxDecoration(
                      border: Border.all(color:secondaryColor.withOpacity(0.3)),
                      color: (events?.awayTeam?.id==matchController.matchDetails.value.competitionDetail?.rankingCompetition?.rankingList?.general?[i].team?.id ||events?.homeTeam?.id==matchController.matchDetails.value.competitionDetail?.rankingCompetition?.rankingList?.general?[i].team?.id)?Colors.grey[400]:Colors.white
                    ),
                    children: [
                      TableCell(child: CustomText(text:" ${(i+1)}"),verticalAlignment: TableCellVerticalAlignment.middle,),
                      TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: CustomText(text:matchController.matchDetails.value.competitionDetail?.rankingCompetition?.rankingList?.general?[i].team?.name.toString(),maxLines: 4,fontSize: 9.sp,)),
                      const TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: CustomText(text:"")),
                      TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: CustomText(text:"${matchController.matchDetails.value.competitionDetail?.rankingCompetition?.rankingList?.general?[i].ranks?["2"]??"0"}",textAlign: TextAlign.center,)),
                      TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: CustomText(text:"${matchController.matchDetails.value.competitionDetail?.rankingCompetition?.rankingList?.general?[i].ranks?["3"]??"0"}",textAlign: TextAlign.center)),
                      TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: CustomText(text:"${matchController.matchDetails.value.competitionDetail?.rankingCompetition?.rankingList?.general?[i].ranks?["4"]??"0"}",textAlign: TextAlign.center)),
                      TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: CustomText(text:"${matchController.matchDetails.value.competitionDetail?.rankingCompetition?.rankingList?.general?[i].ranks?["6"]??"0"}",textAlign: TextAlign.center)),
                      TableCell(verticalAlignment: TableCellVerticalAlignment.middle,child: CustomText(text:"${matchController.matchDetails.value.competitionDetail?.rankingCompetition?.rankingList?.general?[i].ranks?["10"]??"0"}",textAlign: TextAlign.center)),
                    ]
                  )
               ]
            )
          ],

      ) ,
    );
  }
}
