import 'package:basketball_live_score/models/match_model.dart';
import 'package:get/get.dart';

import '../models/match_detail_model.dart';
import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import '../utils/function.dart';

class MatchController extends GetxController {
  final isLoading = false.obs;
  RxList<MatchModel> matches = <MatchModel>[].obs;
  var matchDetails = MatchDetailsModel().obs;
  var selectedDate = DateTime.now().obs;
  final date = ''.obs;

  @override
  void onInit() {
    date.value = formatDate(DateTime.now());
    getMatches();
    super.onInit();
  }

  void setDate(DateTime pickedDate) {
    date.value = formatDate(pickedDate);
    getMatches();
  }

  Future<void> getMatches() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getMatches(date.value);
      matches.value = result;
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getMatchesDetail(int matchID) async {
    print("Controller Match ID : $matchID");
    isLoading.value = true;
    try {
      final result = await ApiRepo().getMatchDetails(matchID);
      matchDetails.value = result;
      print("Match Details : ${matchDetails.value}");
    } catch (e) {
      isLoading.value = false;
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
}
