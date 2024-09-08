import 'dart:async';

import 'package:basketball_live_score/models/match_model.dart';
import 'package:get/get.dart';

import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import '../utils/function.dart';

class LiveController extends GetxController {
  final isLoading = false.obs;
  RxList<MatchModel> matches = <MatchModel>[].obs;
  RxList<MatchModel> lives = <MatchModel>[].obs;
  final date = ''.obs;

  @override
  void onInit() {
    date.value = formatDate(DateTime.now());
    getMatches();
    Timer.periodic(const Duration(seconds: 30), ((timer) async {
      getLiveMatches();
    }));
    super.onInit();
  }

  Future<void> getMatches() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getMatches(date.value);
      matches.value = result;
      for (int i = 0; i < matches.length; i++) {
        for (int j = 0; j < (matches[i].events ?? []).length; j++) {
          if (matches[i].events?[j].state == 2) {
            lives.add(matches[i]);
          }
        }
      }
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getLiveMatches() async {
    try {
      final result = await ApiRepo().getMatches(date.value);
      matches.value = result;
      lives.clear();
      for (int i = 0; i < matches.length; i++) {
        for (int j = 0; j < (matches[i].events ?? []).length; j++) {
          if (matches[i].events?[j].state == 2) {
            lives.add(matches[i]);
          }
        }
      }
    } catch (e) {
      //constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    }
  }
}
