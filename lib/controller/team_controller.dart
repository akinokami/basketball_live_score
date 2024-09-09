import 'package:basketball_live_score/models/player_model.dart';
import 'package:get/get.dart';

import '../models/team_model.dart';
import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';

class TeamController extends GetxController {
  final isLoading = false.obs;
  final isLoading1 = false.obs;
  final teamId = 0.obs;
  Rx<TeamModel> team = TeamModel().obs;
  Rx<PlayerModel> player = PlayerModel().obs;

  @override
  void onInit() {
    teamId.value = Get.arguments['teamId'];
    getTeam();
    super.onInit();
  }

  Future<void> getTeam() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getTeam(teamId.value);
      team.value = result;
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getPlayer() async {
    isLoading1.value = true;
    try {
      final result = await ApiRepo().getPlayer(teamId.value);
      player.value = result;
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading1.value = false;
    }
  }
}
