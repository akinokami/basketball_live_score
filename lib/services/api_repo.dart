import 'package:basketball_live_score/models/match_model.dart';
import 'package:basketball_live_score/models/player_model.dart';
import 'package:basketball_live_score/models/team_model.dart';
import 'package:basketball_live_score/services/api_utils.dart';

import '../utils/custom_exception.dart';
import 'api_constant.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  /// Matches
  Future<List<MatchModel>> getMatches(String date) async {
    try {
      final response =
          await apiUtils.get(url: ApiConstant.baseUrl, queryParameters: {
        "Operation": "MatchList",
        "DeviceType": "a",
        "TimeLag": 28800,
        "Version": "2.7.4",
        "VersionWS": 2.0,
        "CountryCode": "zh_CN",
        "ApplicationID": 14,
        "SportID": 3,
        "Date": date
      });
      final matches = response.data as List;
      return matches.map((item) => MatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  ///Team
  Future<TeamModel> getTeam(int teamId) async {
    try {
      final response =
          await apiUtils.get(url: ApiConstant.baseUrl, queryParameters: {
        "Operation": "TeamSchedule",
        "DeviceType": "a",
        "TimeLag": 28800,
        "Version": "2.7.4",
        "VersionWS": 2.0,
        "CountryCode": "en_CN",
        "ApplicationID": 14,
        "SportID": 3,
        "TeamID": teamId
      });
      final team = response.data;
      return TeamModel.fromJson(team);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<PlayerModel> getPlayer(int teamId) async {
    try {
      final response =
          await apiUtils.get(url: ApiConstant.baseUrl, queryParameters: {
        "Operation": "TeamPlayers",
        "DeviceType": "a",
        "TimeLag": 28800,
        "Version": "2.7.4",
        "VersionWS": 2.0,
        "CountryCode": "en_CN",
        "ApplicationID": 14,
        "SportID": 3,
        "TeamID": teamId
      });
      final player = response.data;
      return PlayerModel.fromJson(player);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
