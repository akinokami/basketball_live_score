import 'package:basketball_live_score/utils/color_const.dart';
import 'package:basketball_live_score/utils/dimen_const.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class RankingWidget extends StatelessWidget {
  const RankingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(

        children: [
          kSizedBoxH10,
          Table(

            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: secondaryColor
                ) ,
                children: [
                  TableCell(child: CustomText(text:'',color: whiteColor,)),
                  TableCell(child: CustomText(text:'',color: whiteColor,)),
                  TableCell(child: CustomText(text:'Team',color: whiteColor)),
                  TableCell(child: CustomText(text:'',color: whiteColor)),
                  TableCell(child: CustomText(text:'%',color: whiteColor)),
                  TableCell(child: CustomText(text:'P',color: whiteColor)),
                  TableCell(child: CustomText(text:'W',color: whiteColor)),
                  TableCell(child: CustomText(text:'L',color: whiteColor)),
                  TableCell(child: CustomText(text:'Str',color: whiteColor)),
                ]
              ),
              TableRow(
                children: [
                  TableCell(child: CustomText(text:'')),
                  TableCell(child: CustomText(text:'1')),
                  TableCell(child: CustomText(text:'Liverpool',maxLines: 3,)),
                  TableCell(child: CustomText(text:'')),
                  TableCell(child: CustomText(text:'38')),
                  TableCell(child: CustomText(text:'32')),
                  TableCell(child: CustomText(text:'3')),
                  TableCell(child: CustomText(text:'3')),
                  TableCell(child: CustomText(text:'85')),
                ]
              ),
             ]
          )
        ],
      ) ,
    );
  }
}
