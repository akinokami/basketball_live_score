// To parse this JSON data, do
//
//     final matchDetailsModel = matchDetailsModelFromJson(jsonString);

import 'dart:convert';

MatchDetailsModel matchDetailsModelFromJson(String str) => MatchDetailsModel.fromJson(json.decode(str));

String matchDetailsModelToJson(MatchDetailsModel data) => json.encode(data.toJson());

class MatchDetailsModel {
  int? id;
  int? date;
  int? scoreradarId;
  int? state;
  int? datePeriod;
  int? coverage;
  int? period;
  int? eventHasRanking;
  int? isDraw;
  int? homeTeamRanking;
  int? awayTeamRanking;
  TeamRankingInfos? homeTeamRankingInfos;
  TeamRankingInfos? awayTeamRankingInfos;
  CompetitionDetail? competitionDetail;
  Team? homeTeam;
  Team? awayTeam;

  double? pourcent1;
  double? pourcent2;
  List<int>? tabs;

  MatchDetailsModel({
    this.id,
    this.date,
    this.scoreradarId,
    this.state,
    this.datePeriod,
    this.coverage,
    this.period,
    this.eventHasRanking,
    this.isDraw,
    this.homeTeamRanking,
    this.awayTeamRanking,
    this.homeTeamRankingInfos,
    this.awayTeamRankingInfos,
    this.competitionDetail,
    this.homeTeam,
    this.awayTeam,

    this.pourcent1,
    this.pourcent2,
    this.tabs,
  });

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) => MatchDetailsModel(
    id: json["id"],
    date: json["date"],
    scoreradarId: json["scoreradarID"],
    state: json["state"],
    datePeriod: json["datePeriod"],
    coverage: json["coverage"],
    period: json["period"],
    eventHasRanking: json["eventHasRanking"],
    isDraw: json["isDraw"],
    homeTeamRanking: json["homeTeamRanking"],
    awayTeamRanking: json["awayTeamRanking"],
    homeTeamRankingInfos: json["homeTeamRankingInfos"] == null ? null : TeamRankingInfos.fromJson(json["homeTeamRankingInfos"]),
    awayTeamRankingInfos: json["awayTeamRankingInfos"] == null ? null : TeamRankingInfos.fromJson(json["awayTeamRankingInfos"]),
    competitionDetail: json["competitionDetail"] == null ? null : CompetitionDetail.fromJson(json["competitionDetail"]),
    homeTeam: json["homeTeam"] == null ? null : Team.fromJson(json["homeTeam"]),
    awayTeam: json["awayTeam"] == null ? null : Team.fromJson(json["awayTeam"]),

    pourcent1: json["pourcent_1"]?.toDouble(),
    pourcent2: json["pourcent_2"]?.toDouble(),
    tabs: json["tabs"] == null ? [] : List<int>.from(json["tabs"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "scoreradarID": scoreradarId,
    "state": state,
    "datePeriod": datePeriod,
    "coverage": coverage,
    "period": period,
    "eventHasRanking": eventHasRanking,
    "isDraw": isDraw,
    "homeTeamRanking": homeTeamRanking,
    "awayTeamRanking": awayTeamRanking,
    "homeTeamRankingInfos": homeTeamRankingInfos?.toJson(),
    "awayTeamRankingInfos": awayTeamRankingInfos?.toJson(),
    "competitionDetail": competitionDetail?.toJson(),
    "homeTeam": homeTeam?.toJson(),
    "awayTeam": awayTeam?.toJson(),

    "pourcent_1": pourcent1,
    "pourcent_2": pourcent2,
    "tabs": tabs == null ? [] : List<dynamic>.from(tabs!.map((x) => x)),
  };
}

class Team {
  int? id;
  String? name;
  String? slug;
  String? imageUrl;
  String? form;
  String? formDom;
  String? formExt;
 // Country? country;
  List<int>? tabs;
  StatisticsForEventList? statisticsForEventList;

  Team({
    this.id,
    this.name,
    this.slug,
    this.imageUrl,
    this.form,
    this.formDom,
    this.formExt,
   // this.country,
    this.tabs,
    this.statisticsForEventList,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    imageUrl: json["imageURL"],
    form: json["form"],
    formDom: json["formDom"],
    formExt: json["formExt"],
    //country: json["country"] == null ? null : Country.fromJson(json["country"]),
    tabs: json["tabs"] == null ? [] : List<int>.from(json["tabs"]!.map((x) => x)),
    statisticsForEventList: json["statisticsForEventList"] == null ? null : StatisticsForEventList.fromJson(json["statisticsForEventList"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "imageURL": imageUrl,
    "form": form,
    "formDom": formDom,
    "formExt": formExt,
    //"country": country?.toJson(),
    "tabs": tabs == null ? [] : List<dynamic>.from(tabs!.map((x) => x)),
    "statisticsForEventList": statisticsForEventList?.toJson(),
  };
}

class Country {
  int? id;
  Name? name;
  ImageUrl? imageUrl;
  Slug? slug;

  Country({
    this.id,
    this.name,
    this.imageUrl,
    this.slug,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    imageUrl: imageUrlValues.map[json["imageURL"]]!,
    slug: slugValues.map[json["slug"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "imageURL": imageUrlValues.reverse[imageUrl],
    "slug": slugValues.reverse[slug],
  };
}

enum ImageUrl {
  USA_1
}

final imageUrlValues = EnumValues({
  "usa_1": ImageUrl.USA_1
});

enum Name {
  USA
}

final nameValues = EnumValues({
  "USA": Name.USA
});

enum Slug {
  USA
}

final slugValues = EnumValues({
  "usa": Slug.USA
});

class StatisticsForEventList {
  Map<String, List<StatDetail>>? teamStatistics;

  StatisticsForEventList({
    this.teamStatistics,
  });

  factory StatisticsForEventList.fromJson(Map<String, dynamic> json) {
    Map<String, List<StatDetail>> teamStats = {};
    json.forEach((key, value) {
      teamStats[key] = List<StatDetail>.from(value.map((x) => StatDetail.fromJson(x)));
    });
    return StatisticsForEventList(
      teamStatistics: teamStats,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    teamStatistics?.forEach((key, value) {
      data[key] = List<dynamic>.from(value.map((x) => x.toJson()));
    });
    return data;
  }
}

class StatDetail {
  String? statName;
  String? code;
  List<StatList>? statList;

  StatDetail({
    this.statName,
    this.code,
    this.statList,
  });

  factory StatDetail.fromJson(Map<String, dynamic> json) => StatDetail(
    statName: json["statName"],
    code: json["code"],
    statList: json["statList"] == null ? [] : List<StatList>.from(json["statList"]!.map((x) => StatList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statName": statName,
    "code": code,
    "statList": statList == null ? [] : List<dynamic>.from(statList!.map((x) => x.toJson())),
  };
}

class StatList {
  String? code;
  String? name;
  int? value;
  int? maxValue;

  StatList({
    this.code,
    this.name,
    this.value,
    this.maxValue,
  });

  factory StatList.fromJson(Map<String, dynamic> json) => StatList(
    code: json["code"],
    name: json["name"],
    value: json["value"],
    maxValue: json["maxValue"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "value": value,
    "maxValue": maxValue,
  };
}

class TeamRankingInfos {
  int? idEquipe;
  int? place;
  int? jour;
  double? points;
  int? v;
  int? n;
  int? d;
  int? bp;
  int? bc;
  int? streak;

  TeamRankingInfos({
    this.idEquipe,
    this.place,
    this.jour,
    this.points,
    this.v,
    this.n,
    this.d,
    this.bp,
    this.bc,
    this.streak,
  });

  factory TeamRankingInfos.fromJson(Map<String, dynamic> json) => TeamRankingInfos(
    idEquipe: json["id_equipe"],
    place: json["place"],
    jour: json["jour"],
    points: json["points"]?.toDouble(),
    v: json["V"],
    n: json["N"],
    d: json["D"],
    bp: json["BP"],
    bc: json["BC"],
    streak: json["streak"],
  );

  Map<String, dynamic> toJson() => {
    "id_equipe": idEquipe,
    "place": place,
    "jour": jour,
    "points": points,
    "V": v,
    "N": n,
    "D": d,
    "BP": bp,
    "BC": bc,
    "streak": streak,
  };
}

class CompetitionDetail {
  int? id;
  int? callId;
  dynamic name;
  String? competitionTranslateName;
  String? competitionTranslateNameShort;
  int? orderInCountry;
  String? imageUrl;
  bool? excluded;
  String? slug;
  RankingCompetition? rankingCompetition;
  List<League>? leagues;

  CompetitionDetail({
    this.id,
    this.callId,
    this.name,
    this.competitionTranslateName,
    this.competitionTranslateNameShort,
    this.orderInCountry,
    this.imageUrl,
    this.excluded,
    this.slug,
    this.rankingCompetition,
    this.leagues,
  });

  factory CompetitionDetail.fromJson(Map<String, dynamic> json) => CompetitionDetail(
    id: json["id"],
    callId: json["callId"],
    name: json["name"],
    competitionTranslateName: json["competitionTranslateName"],
    competitionTranslateNameShort: json["competitionTranslateNameShort"],
    orderInCountry: json["orderInCountry"],
    imageUrl: json["imageURL"],
    excluded: json["excluded"],
    slug: json["slug"],
    rankingCompetition: json["rankingCompetition"] == null ? null : RankingCompetition.fromJson(json["rankingCompetition"]),
    leagues: json["leagues"] == null ? [] : List<League>.from(json["leagues"]!.map((x) => League.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "callId": callId,
    "name": name,
    "competitionTranslateName": competitionTranslateName,
    "competitionTranslateNameShort": competitionTranslateNameShort,
    "orderInCountry": orderInCountry,
    "imageURL": imageUrl,
    "excluded": excluded,
    "slug": slug,
    "rankingCompetition": rankingCompetition?.toJson(),
    "leagues": leagues == null ? [] : List<dynamic>.from(leagues!.map((x) => x.toJson())),
  };
}

class League {
  int? id;
  String? name;
  int? isMain;

  League({
    this.id,
    this.name,
    this.isMain,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    isMain: json["isMain"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "isMain": isMain,
  };
}

class RankingCompetition {
  bool? ratio;
  Map<String, String>? columns;
  RankingList? rankingList;

  RankingCompetition({
    this.ratio,
    this.columns,
    this.rankingList,
  });

  factory RankingCompetition.fromJson(Map<String, dynamic> json) => RankingCompetition(
    ratio: json["ratio"],
    columns: Map.from(json["columns"]!).map((k, v) => MapEntry<String, String>(k, v)),
    rankingList: json["rankingList"] == null ? null : RankingList.fromJson(json["rankingList"]),
  );

  Map<String, dynamic> toJson() => {
    "ratio": ratio,
    "columns": Map.from(columns!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "rankingList": rankingList?.toJson(),
  };
}

class RankingList {
  List<Form>? general;
  List<Form>? form;

  RankingList({
    this.general,
    this.form,
  });

  factory RankingList.fromJson(Map<String, dynamic> json) => RankingList(
    general: json["general"] == null ? [] : List<Form>.from(json["general"]!.map((x) => Form.fromJson(x))),
    form: json["form"] == null ? [] : List<Form>.from(json["form"]!.map((x) => Form.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "general": general == null ? [] : List<dynamic>.from(general!.map((x) => x.toJson())),
    "form": form == null ? [] : List<dynamic>.from(form!.map((x) => x.toJson())),
  };
}

class Form {
  Map<String, dynamic>? ranks;
  Team? team;

  Form({
    this.ranks,
    this.team,
  });

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    ranks: Map.from(json["ranks"]!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    team: json["team"] == null ? null : Team.fromJson(json["team"]),
  );

  Map<String, dynamic> toJson() => {
    "ranks": Map.from(ranks!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "team": team?.toJson(),
  };
}

class Score {
  int? home;
  int? away;

  Score({
    this.home,
    this.away,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    home: json["home"],
    away: json["away"],
  );

  Map<String, dynamic> toJson() => {
    "home": home,
    "away": away,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
