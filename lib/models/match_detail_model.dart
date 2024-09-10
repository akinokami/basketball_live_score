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
  int? coverage;
  int? period;
  int? eventHasRanking;
  int? isDraw;
  int? homeTeamRanking;
  int? awayTeamRanking;
  CompetitionDetail? competitionDetail;

  MatchDetailsModel({
    this.id,
    this.date,
    this.scoreradarId,
    this.day,
    this.state,
    this.coverage,
    this.period,
    this.eventHasRanking,
    this.isDraw,
    this.homeTeamRanking,
    this.awayTeamRanking,
    this.competitionDetail,
  });

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) => MatchDetailsModel(
    id: json["id"],
    date: json["date"],
    scoreradarId: json["scoreradarID"],
    day: json["day"],
    state: json["state"],
    coverage: json["coverage"],
    period: json["period"],
    eventHasRanking: json["eventHasRanking"],
    isDraw: json["isDraw"],
    homeTeamRanking: json["homeTeamRanking"],
    awayTeamRanking: json["awayTeamRanking"],
    competitionDetail: json["competitionDetail"] == null ? null : CompetitionDetail.fromJson(json["competitionDetail"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "scoreradarID": scoreradarId,
    "day": day,
    "state": state,
    "coverage": coverage,
    "period": period,
    "eventHasRanking": eventHasRanking,
    "isDraw": isDraw,
    "homeTeamRanking": homeTeamRanking,
    "awayTeamRanking": awayTeamRanking,
    "competitionDetail": competitionDetail?.toJson(),
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
  RankingCompetition? rankingCompetition;

  CompetitionDetail({
    this.id,
    this.callId,
    this.name,
    this.competitionTranslateName,
    this.competitionTranslateNameShort,
    this.excluded,
    this.slug,
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
  Map<String, dynamic>? ranks;
  Team? team;

  Domicile({
    this.ranks,
    this.team,
  });

  factory Domicile.fromJson(Map<String, dynamic> json) => Domicile(
    ranks: Map.from(json["ranks"]!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    team: json["team"] == null ? null : Team.fromJson(json["team"]),
  );

  Map<String, dynamic> toJson() => {
    "ranks": Map.from(ranks!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "team": team?.toJson(),
  };
}

class Team {
  int? id;
  String? name;
  String? slug;
  Country? country;
  List<int>? tabs;
  String? form;
  String? formDom;
  String? formExt;

  Team({
    this.id,
    this.name,
    this.slug,
    this.country,
    this.tabs,
    this.form,
    this.formDom,
    this.formExt,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
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

class Country {
  int? id;
  dynamic name;

  Country({
    this.id,
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
