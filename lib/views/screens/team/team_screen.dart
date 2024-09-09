import 'package:basketball_live_score/views/screens/team/team_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/team_controller.dart';
import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';
import '../../widgets/custom_loading.dart';
import '../../widgets/custom_text.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teamController = Get.put(TeamController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: secondaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: CustomText(
            text: 'team'.tr,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        body: Obx(
          () => teamController.isLoading.value
              ? const Center(
                  child: CustomLoading(),
                )
              : Column(
                  children: [
                    Container(
                      color: secondaryColor,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sports_soccer,
                                  size: 40.sp,
                                  color: Colors.white,
                                ),
                                kSizedBoxW5,
                                CustomText(
                                  text:
                                      'aaa', //teamController.team.value.name ?? '',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          TabBar(
                            onTap: (value) {
                              if (value == 1) {
                                teamController.getPlayer();
                              }
                            },
                            unselectedLabelColor: Colors.white,
                            indicatorColor: Colors.white,
                            dividerColor: Colors.transparent,
                            labelColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(text: 'matches'.tr),
                              Tab(text: 'players'.tr),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(),
                          Obx(
                            () => teamController.isLoading1.value
                                ? const Center(
                                    child: CustomLoading(),
                                  )
                                : PlayerWidget(
                                    player: teamController.player.value,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
