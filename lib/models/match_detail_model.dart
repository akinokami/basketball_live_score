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
  int? day;
  int? state;
  Share? share;
  int? coverage;
  int? period;
  int? eventHasRanking;
  int? isDraw;
  int? homeTeamRanking;
  int? awayTeamRanking;
  TeamRankingInfos? homeTeamRankingInfos;
  TeamRankingInfos? awayTeamRankingInfos;
  CompetitionDetail? competitionDetail;
  MatchDetailsModelHomeTeam? homeTeam;
  AwayTeam? awayTeam;
  Map<String, Score>? scores;
  Tip? tip;
  double? pourcent1;
  double? pourcent2;
  List<int>? tabs;

  MatchDetailsModel({
    this.id,
    this.date,
    this.scoreradarId,
    this.day,
    this.state,
    this.share,
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
    this.scores,
    this.tip,
    this.pourcent1,
    this.pourcent2,
    this.tabs,
  });

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) => MatchDetailsModel(
    id: json["id"],
    date: json["date"],
    scoreradarId: json["scoreradarID"],
    day: json["day"],
    state: json["state"],
    share: json["share"] == null ? null : Share.fromJson(json["share"]),
    coverage: json["coverage"],
    period: json["period"],
    eventHasRanking: json["eventHasRanking"],
    isDraw: json["isDraw"],
    homeTeamRanking: json["homeTeamRanking"],
    awayTeamRanking: json["awayTeamRanking"],
    homeTeamRankingInfos: json["homeTeamRankingInfos"] == null ? null : TeamRankingInfos.fromJson(json["homeTeamRankingInfos"]),
    awayTeamRankingInfos: json["awayTeamRankingInfos"] == null ? null : TeamRankingInfos.fromJson(json["awayTeamRankingInfos"]),
    competitionDetail: json["competitionDetail"] == null ? null : CompetitionDetail.fromJson(json["competitionDetail"]),
    homeTeam: json["homeTeam"] == null ? null : MatchDetailsModelHomeTeam.fromJson(json["homeTeam"]),
    awayTeam: json["awayTeam"] == null ? null : AwayTeam.fromJson(json["awayTeam"]),
    scores: Map.from(json["scores"]!).map((k, v) => MapEntry<String, Score>(k, Score.fromJson(v))),
    tip: json["tip"] == null ? null : Tip.fromJson(json["tip"]),
    pourcent1: json["pourcent_1"]?.toDouble(),
    pourcent2: json["pourcent_2"]?.toDouble(),
    tabs: json["tabs"] == null ? [] : List<int>.from(json["tabs"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "scoreradarID": scoreradarId,
    "day": day,
    "state": state,
    "share": share?.toJson(),
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
    "scores": Map.from(scores!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "tip": tip?.toJson(),
    "pourcent_1": pourcent1,
    "pourcent_2": pourcent2,
    "tabs": tabs == null ? [] : List<dynamic>.from(tabs!.map((x) => x)),
  };
}

class AwayTeam {
  int? id;
  String? name;
  String? slug;
  String? form;
  String? formDom;
  AwayTeamCountry? country;
  List<int>? tabs;
  AwayTeamLastEventList? lastEventList;
  List<EventsStatsCategory>? eventsStatsCategories;
  StatisticsForEventList? statisticsForEventList;

  AwayTeam({
    this.id,
    this.name,
    this.slug,
    this.form,
    this.formDom,
    this.country,
    this.tabs,
    this.lastEventList,
    this.eventsStatsCategories,
    this.statisticsForEventList,
  });

  factory AwayTeam.fromJson(Map<String, dynamic> json) => AwayTeam(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    form: json["form"],
    formDom: json["formDom"],
    country: json["country"] == null ? null : AwayTeamCountry.fromJson(json["country"]),
    tabs: json["tabs"] == null ? [] : List<int>.from(json["tabs"]!.map((x) => x)),
    lastEventList: json["lastEventList"] == null ? null : AwayTeamLastEventList.fromJson(json["lastEventList"]),
    eventsStatsCategories: json["eventsStatsCategories"] == null ? [] : List<EventsStatsCategory>.from(json["eventsStatsCategories"]!.map((x) => EventsStatsCategory.fromJson(x))),
    statisticsForEventList: json["statisticsForEventList"] == null ? null : StatisticsForEventList.fromJson(json["statisticsForEventList"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "form": form,
    "formDom": formDom,
    "country": country?.toJson(),
    "tabs": tabs == null ? [] : List<dynamic>.from(tabs!.map((x) => x)),
    "lastEventList": lastEventList?.toJson(),
    "eventsStatsCategories": eventsStatsCategories == null ? [] : List<dynamic>.from(eventsStatsCategories!.map((x) => x.toJson())),
    "statisticsForEventList": statisticsForEventList?.toJson(),
  };
}

class AwayTeamCountry {
  int? id;
  dynamic name;

  AwayTeamCountry({
    this.id,
    this.name,
  });

  factory AwayTeamCountry.fromJson(Map<String, dynamic> json) => AwayTeamCountry(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class EventsStatsCategory {
  dynamic statName;
  String? code;
  List<EventsStatsCategoryStatList>? statList;

  EventsStatsCategory({
    this.statName,
    this.code,
    this.statList,
  });

  factory EventsStatsCategory.fromJson(Map<String, dynamic> json) => EventsStatsCategory(
    statName: json["statName"],
    code: json["code"],
    statList: json["statList"] == null ? [] : List<EventsStatsCategoryStatList>.from(json["statList"]!.map((x) => EventsStatsCategoryStatList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statName": statName,
    "code": code,
    "statList": statList == null ? [] : List<dynamic>.from(statList!.map((x) => x.toJson())),
  };
}

class EventsStatsCategoryStatList {
  String? code;
  String? name;
  double? value;
  Main? main;
  int? percent;
  int? statLevel;
  int? average;

  EventsStatsCategoryStatList({
    this.code,
    this.name,
    this.value,
    this.main,
    this.percent,
    this.statLevel,
    this.average,
  });

  factory EventsStatsCategoryStatList.fromJson(Map<String, dynamic> json) => EventsStatsCategoryStatList(
    code: json["code"],
    name: json["name"],
    value: json["value"]?.toDouble(),
    main: mainValues.map[json["main"]]!,
    percent: json["percent"],
    statLevel: json["statLevel"],
    average: json["average"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "value": value,
    "main": mainValues.reverse[main],
    "percent": percent,
    "statLevel": statLevel,
    "average": average,
  };
}

enum Main {
  HIGH,
  LOW
}

final mainValues = EnumValues({
  "high": Main.HIGH,
  "low": Main.LOW
});

class AwayTeamLastEventList {
  List<Purple7357538>? the7357538;

  AwayTeamLastEventList({
    this.the7357538,
  });

  factory AwayTeamLastEventList.fromJson(Map<String, dynamic> json) => AwayTeamLastEventList(
    the7357538: json["7357538"] == null ? [] : List<Purple7357538>.from(json["7357538"]!.map((x) => Purple7357538.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "7357538": the7357538 == null ? [] : List<dynamic>.from(the7357538!.map((x) => x.toJson())),
  };
}

class Purple7357538 {
  int? id;
  int? date;
  int? day;
  int? state;
  int? coverage;
  int? period;
  CompetitionDetail? competitionDetail;
  The7357538HomeTeam? homeTeam;
  Team? awayTeam;
  Map<String, Score>? scores;
  double? pourcent1;
  double? pourcent2;

  Purple7357538({
    this.id,
    this.date,
    this.day,
    this.state,
    this.coverage,
    this.period,
    this.competitionDetail,
    this.homeTeam,
    this.awayTeam,
    this.scores,
    this.pourcent1,
    this.pourcent2,
  });

  factory Purple7357538.fromJson(Map<String, dynamic> json) => Purple7357538(
    id: json["id"],
    date: json["date"],
    day: json["day"],
    state: json["state"],
    coverage: json["coverage"],
    period: json["period"],
    competitionDetail: json["competitionDetail"] == null ? null : CompetitionDetail.fromJson(json["competitionDetail"]),
    homeTeam: json["homeTeam"] == null ? null : The7357538HomeTeam.fromJson(json["homeTeam"]),
    awayTeam: json["awayTeam"] == null ? null : Team.fromJson(json["awayTeam"]),
    scores: Map.from(json["scores"]!).map((k, v) => MapEntry<String, Score>(k, Score.fromJson(v))),
    pourcent1: json["pourcent_1"]?.toDouble(),
    pourcent2: json["pourcent_2"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "day": day,
    "state": state,
    "coverage": coverage,
    "period": period,
    "competitionDetail": competitionDetail?.toJson(),
    "homeTeam": homeTeam?.toJson(),
    "awayTeam": awayTeam?.toJson(),
    "scores": Map.from(scores!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "pourcent_1": pourcent1,
    "pourcent_2": pourcent2,
  };
}

class Team {
  int? id;
  String? name;
  String? slug;
  AwayTeamCountry? country;
  List<int>? tabs;

  Team({
    this.id,
    this.name,
    this.slug,
    this.country,
    this.tabs,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    country: json["country"] == null ? null : AwayTeamCountry.fromJson(json["country"]),
    tabs: json["tabs"] == null ? [] : List<int>.from(json["tabs"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "country": country?.toJson(),
    "tabs": tabs == null ? [] : List<dynamic>.from(tabs!.map((x) => x)),
  };
}

class CompetitionDetail {
  int? id;
  int? callId;
  String? name;
  String? competitionTranslateName;
  String? competitionTranslateNameShort;
  bool? excluded;
  String? slug;
  Season? season;
  int? sportId;
  RankingCompetition? rankingCompetition;

  CompetitionDetail({
    this.id,
    this.callId,
    this.name,
    this.competitionTranslateName,
    this.competitionTranslateNameShort,
    this.excluded,
    this.slug,
    this.season,
    this.sportId,
    this.rankingCompetition,
  });

  factory CompetitionDetail.fromJson(Map<String, dynamic> json) => CompetitionDetail(
    id: json["id"],
    callId: json["callId"],
    name: json["name"],
    competitionTranslateName: json["competitionTranslateName"],
    competitionTranslateNameShort: json["competitionTranslateNameShort"],
    excluded: json["excluded"],
    slug: json["slug"],
    season: json["season"] == null ? null : Season.fromJson(json["season"]),
    sportId: json["sportId"],
    rankingCompetition: json["rankingCompetition"] == null ? null : RankingCompetition.fromJson(json["rankingCompetition"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "callId": callId,
    "name": name,
    "competitionTranslateName": competitionTranslateName,
    "competitionTranslateNameShort": competitionTranslateNameShort,
    "excluded": excluded,
    "slug": slug,
    "season": season?.toJson(),
    "sportId": sportId,
    "rankingCompetition": rankingCompetition?.toJson(),
  };
}

class RankingCompetition {
  Map<String, String>? columns;
  RankingList? rankingList;

  RankingCompetition({
    this.columns,
    this.rankingList,
  });

  factory RankingCompetition.fromJson(Map<String, dynamic> json) => RankingCompetition(
    columns: Map.from(json["columns"]!).map((k, v) => MapEntry<String, String>(k, v)),
    rankingList: json["rankingList"] == null ? null : RankingList.fromJson(json["rankingList"]),
  );

  Map<String, dynamic> toJson() => {
    "columns": Map.from(columns!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "rankingList": rankingList?.toJson(),
  };
}

class RankingList {
  List<Domicile>? general;
  List<Domicile>? domicile;
  List<Domicile>? exterieur;

  RankingList({
    this.general,
    this.domicile,
    this.exterieur,
  });

  factory RankingList.fromJson(Map<String, dynamic> json) => RankingList(
    general: json["general"] == null ? [] : List<Domicile>.from(json["general"]!.map((x) => Domicile.fromJson(x))),
    domicile: json["domicile"] == null ? [] : List<Domicile>.from(json["domicile"]!.map((x) => Domicile.fromJson(x))),
    exterieur: json["exterieur"] == null ? [] : List<Domicile>.from(json["exterieur"]!.map((x) => Domicile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "general": general == null ? [] : List<dynamic>.from(general!.map((x) => x.toJson())),
    "domicile": domicile == null ? [] : List<dynamic>.from(domicile!.map((x) => x.toJson())),
    "exterieur": exterieur == null ? [] : List<dynamic>.from(exterieur!.map((x) => x.toJson())),
  };
}

class Domicile {
  Map<String, int>? ranks;
  TeamClass? team;

  Domicile({
    this.ranks,
    this.team,
  });

  factory Domicile.fromJson(Map<String, dynamic> json) => Domicile(
    ranks: Map.from(json["ranks"]!).map((k, v) => MapEntry<String, int>(k, v)),
    team: json["team"] == null ? null : TeamClass.fromJson(json["team"]),
  );

  Map<String, dynamic> toJson() => {
    "ranks": Map.from(ranks!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "team": team?.toJson(),
  };
}

class TeamClass {
  int? id;
  String? name;
  String? slug;
  AwayTeamCountry? country;
  List<int>? tabs;
  String? form;
  String? formDom;
  String? formExt;

  TeamClass({
    this.id,
    this.name,
    this.slug,
    this.country,
    this.tabs,
    this.form,
    this.formDom,
    this.formExt,
  });

  factory TeamClass.fromJson(Map<String, dynamic> json) => TeamClass(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    country: json["country"] == null ? null : AwayTeamCountry.fromJson(json["country"]),
    tabs: json["tabs"] == null ? [] : List<int>.from(json["tabs"]!.map((x) => x)),
    form: json["form"],
    formDom: json["formDom"],
    formExt: json["formExt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "country": country?.toJson(),
    "tabs": tabs == null ? [] : List<dynamic>.from(tabs!.map((x) => x)),
    "form": form,
    "formDom": formDom,
    "formExt": formExt,
  };
}

class Season {
  int? id;
  String? name;
  int? startDate;
  int? endDate;
  Competition? competition;

  Season({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.competition,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
    id: json["id"],
    name: json["name"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    competition: json["competition"] == null ? null : Competition.fromJson(json["competition"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "startDate": startDate,
    "endDate": endDate,
    "competition": competition?.toJson(),
  };
}

class Competition {
  int? id;
  String? name;
  int? order;
  String? slug;
  CompetitionCountry? country;

  Competition({
    this.id,
    this.name,
    this.order,
    this.slug,
    this.country,
  });

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
    id: json["id"],
    name: json["name"],
    order: json["order"],
    slug: json["slug"],
    country: json["country"] == null ? null : CompetitionCountry.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "order": order,
    "slug": slug,
    "country": country?.toJson(),
  };
}

class CompetitionCountry {
  int? id;
  String? name;
  int? sportId;
  String? imageUrl;
  String? slug;

  CompetitionCountry({
    this.id,
    this.name,
    this.sportId,
    this.imageUrl,
    this.slug,
  });

  factory CompetitionCountry.fromJson(Map<String, dynamic> json) => CompetitionCountry(
    id: json["id"],
    name: json["name"],
    sportId: json["sportId"],
    imageUrl: json["imageURL"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sportId": sportId,
    "imageURL": imageUrl,
    "slug": slug,
  };
}

class The7357538HomeTeam {
  int? id;

  The7357538HomeTeam({
    this.id,
  });

  factory The7357538HomeTeam.fromJson(Map<String, dynamic> json) => The7357538HomeTeam(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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

class StatisticsForEventList {
  List<StatisticsForEventList7357538>? the7357538;

  StatisticsForEventList({
    this.the7357538,
  });

  factory StatisticsForEventList.fromJson(Map<String, dynamic> json) => StatisticsForEventList(
    the7357538: json["7357538"] == null ? [] : List<StatisticsForEventList7357538>.from(json["7357538"]!.map((x) => StatisticsForEventList7357538.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "7357538": the7357538 == null ? [] : List<dynamic>.from(the7357538!.map((x) => x.toJson())),
  };
}

class StatisticsForEventList7357538 {
  String? statName;
  String? code;
  List<The7357538StatList>? statList;

  StatisticsForEventList7357538({
    this.statName,
    this.code,
    this.statList,
  });

  factory StatisticsForEventList7357538.fromJson(Map<String, dynamic> json) => StatisticsForEventList7357538(
    statName: json["statName"],
    code: json["code"],
    statList: json["statList"] == null ? [] : List<The7357538StatList>.from(json["statList"]!.map((x) => The7357538StatList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statName": statName,
    "code": code,
    "statList": statList == null ? [] : List<dynamic>.from(statList!.map((x) => x.toJson())),
  };
}

class The7357538StatList {
  String? code;
  String? name;
  int? value;

  The7357538StatList({
    this.code,
    this.name,
    this.value,
  });

  factory The7357538StatList.fromJson(Map<String, dynamic> json) => The7357538StatList(
    code: json["code"],
    name: json["name"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "value": value,
  };
}

class TeamRankingInfos {
  int? idEquipe;
  int? place;
  int? jour;
  int? points;
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
    points: json["points"],
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

class MatchDetailsModelHomeTeam {
  int? id;
  String? name;
  String? slug;
  String? form;
  String? formDom;
  String? formExt;
  AwayTeamCountry? country;
  List<int>? tabs;
  HomeTeamLastEventList? lastEventList;
  List<EventsStatsCategory>? eventsStatsCategories;
  StatisticsForEventList? statisticsForEventList;

  MatchDetailsModelHomeTeam({
    this.id,
    this.name,
    this.slug,
    this.form,
    this.formDom,
    this.formExt,
    this.country,
    this.tabs,
    this.lastEventList,
    this.eventsStatsCategories,
    this.statisticsForEventList,
  });

  factory MatchDetailsModelHomeTeam.fromJson(Map<String, dynamic> json) => MatchDetailsModelHomeTeam(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    form: json["form"],
    formDom: json["formDom"],
    formExt: json["formExt"],
    country: json["country"] == null ? null : AwayTeamCountry.fromJson(json["country"]),
    tabs: json["tabs"] == null ? [] : List<int>.from(json["tabs"]!.map((x) => x)),
    lastEventList: json["lastEventList"] == null ? null : HomeTeamLastEventList.fromJson(json["lastEventList"]),
    eventsStatsCategories: json["eventsStatsCategories"] == null ? [] : List<EventsStatsCategory>.from(json["eventsStatsCategories"]!.map((x) => EventsStatsCategory.fromJson(x))),
    statisticsForEventList: json["statisticsForEventList"] == null ? null : StatisticsForEventList.fromJson(json["statisticsForEventList"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "form": form,
    "formDom": formDom,
    "formExt": formExt,
    "country": country?.toJson(),
    "tabs": tabs == null ? [] : List<dynamic>.from(tabs!.map((x) => x)),
    "lastEventList": lastEventList?.toJson(),
    "eventsStatsCategories": eventsStatsCategories == null ? [] : List<dynamic>.from(eventsStatsCategories!.map((x) => x.toJson())),
    "statisticsForEventList": statisticsForEventList?.toJson(),
  };
}

class HomeTeamLastEventList {
  List<Fluffy7357538>? the7357538;

  HomeTeamLastEventList({
    this.the7357538,
  });

  factory HomeTeamLastEventList.fromJson(Map<String, dynamic> json) => HomeTeamLastEventList(
    the7357538: json["7357538"] == null ? [] : List<Fluffy7357538>.from(json["7357538"]!.map((x) => Fluffy7357538.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "7357538": the7357538 == null ? [] : List<dynamic>.from(the7357538!.map((x) => x.toJson())),
  };
}

class Fluffy7357538 {
  int? id;
  int? date;
  String? round;
  int? state;
  int? coverage;
  int? period;
  CompetitionDetail? competitionDetail;
  Team? homeTeam;
  Team? awayTeam;
  Map<String, Score>? scores;
  double? pourcent1;
  double? pourcent2;
  int? day;

  Fluffy7357538({
    this.id,
    this.date,
    this.round,
    this.state,
    this.coverage,
    this.period,
    this.competitionDetail,
    this.homeTeam,
    this.awayTeam,
    this.scores,
    this.pourcent1,
    this.pourcent2,
    this.day,
  });

  factory Fluffy7357538.fromJson(Map<String, dynamic> json) => Fluffy7357538(
    id: json["id"],
    date: json["date"],
    round: json["round"],
    state: json["state"],
    coverage: json["coverage"],
    period: json["period"],
    competitionDetail: json["competitionDetail"] == null ? null : CompetitionDetail.fromJson(json["competitionDetail"]),
    homeTeam: json["homeTeam"] == null ? null : Team.fromJson(json["homeTeam"]),
    awayTeam: json["awayTeam"] == null ? null : Team.fromJson(json["awayTeam"]),
    scores: Map.from(json["scores"]!).map((k, v) => MapEntry<String, Score>(k, Score.fromJson(v))),
    pourcent1: json["pourcent_1"]?.toDouble(),
    pourcent2: json["pourcent_2"]?.toDouble(),
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "round": round,
    "state": state,
    "coverage": coverage,
    "period": period,
    "competitionDetail": competitionDetail?.toJson(),
    "homeTeam": homeTeam?.toJson(),
    "awayTeam": awayTeam?.toJson(),
    "scores": Map.from(scores!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "pourcent_1": pourcent1,
    "pourcent_2": pourcent2,
    "day": day,
  };
}

class Share {
  String? text;
  String? url;
  String? image;

  Share({
    this.text,
    this.url,
    this.image,
  });

  factory Share.fromJson(Map<String, dynamic> json) => Share(
    text: json["text"],
    url: json["url"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "url": url,
    "image": image,
  };
}

class Tip {
  String? oddsName;
  String? oddsType;
  int? isDraw;
  List<OddsTypeList>? oddsTypeList;

  Tip({
    this.oddsName,
    this.oddsType,
    this.isDraw,
    this.oddsTypeList,
  });

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
    oddsName: json["oddsName"],
    oddsType: json["oddsType"],
    isDraw: json["isDraw"],
    oddsTypeList: json["oddsTypeList"] == null ? [] : List<OddsTypeList>.from(json["oddsTypeList"]!.map((x) => OddsTypeList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "oddsName": oddsName,
    "oddsType": oddsType,
    "isDraw": isDraw,
    "oddsTypeList": oddsTypeList == null ? [] : List<dynamic>.from(oddsTypeList!.map((x) => x.toJson())),
  };
}

class OddsTypeList {
  String? type;
  String? oddsTypeName;
  bool? ourTip;
  dynamic oddsBookmakerList;

  OddsTypeList({
    this.type,
    this.oddsTypeName,
    this.ourTip,
    this.oddsBookmakerList,
  });

  factory OddsTypeList.fromJson(Map<String, dynamic> json) => OddsTypeList(
    type: json["type"],
    oddsTypeName: json["oddsTypeName"],
    ourTip: json["ourTip"],
    oddsBookmakerList: json["oddsBookmakerList"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "oddsTypeName": oddsTypeName,
    "ourTip": ourTip,
    "oddsBookmakerList": oddsBookmakerList,
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
