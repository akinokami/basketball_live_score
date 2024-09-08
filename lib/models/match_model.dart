class MatchModel {
  int? id;
  int? callId;
  String? name;
  String? competitionTranslateName;
  String? competitionTranslateNameShort;
  String? type;
  int? maxDay;
  bool? excluded;
  List<int>? tabs;
  String? slug;
  Season? season;
  List<Events>? events;
  int? sportId;

  MatchModel(
      {this.id,
      this.callId,
      this.name,
      this.competitionTranslateName,
      this.competitionTranslateNameShort,
      this.type,
      this.maxDay,
      this.excluded,
      this.tabs,
      this.slug,
      this.season,
      this.events,
      this.sportId});

  MatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    callId = json['callId'];
    name = json['name'];
    competitionTranslateName = json['competitionTranslateName'];
    competitionTranslateNameShort = json['competitionTranslateNameShort'];
    type = json['type'];
    maxDay = json['maxDay'];
    excluded = json['excluded'];
    tabs = json['tabs'].cast<int>();
    slug = json['slug'];
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    sportId = json['sportId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['callId'] = callId;
    data['name'] = name;
    data['competitionTranslateName'] = competitionTranslateName;
    data['competitionTranslateNameShort'] = competitionTranslateNameShort;
    data['type'] = type;
    data['maxDay'] = maxDay;
    data['excluded'] = excluded;
    data['tabs'] = tabs;
    data['slug'] = slug;
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    data['sportId'] = sportId;
    return data;
  }
}

class Season {
  int? id;
  String? name;
  int? startDate;
  int? endDate;
  Competition? competition;

  Season({this.id, this.name, this.startDate, this.endDate, this.competition});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    competition = json['competition'] != null
        ? Competition.fromJson(json['competition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    if (competition != null) {
      data['competition'] = competition!.toJson();
    }
    return data;
  }
}

class Competition {
  int? id;
  String? name;
  int? order;
  Country? country;

  Competition({this.id, this.name, this.order, this.country});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;
  int? sportId;
  String? imageURL;
  String? slug;

  Country({this.id, this.name, this.sportId, this.imageURL, this.slug});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sportId'];
    imageURL = json['imageURL'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sportId'] = sportId;
    data['imageURL'] = imageURL;
    data['slug'] = slug;
    return data;
  }
}

class Events {
  int? id;
  int? date;
  int? day;
  int? state;
  int? coverage;
  int? period;
  int? liveTime;
  int? liveTimeRemaining;
  int? eventHasRanking;
  int? important;
  int? competitionId;
  int? competitionCallId;
  Team? homeTeam;
  Team? awayTeam;
  Scores? scores;
  double? pourcent1;
  double? pourcent2;

  Events({
    this.id,
    this.date,
    this.day,
    this.state,
    this.coverage,
    this.period,
    this.liveTime,
    this.liveTimeRemaining,
    this.eventHasRanking,
    this.important,
    this.competitionId,
    this.competitionCallId,
    this.homeTeam,
    this.awayTeam,
    this.scores,
    this.pourcent1,
    this.pourcent2,
  });

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    day = json['day'];
    state = json['state'];
    coverage = json['coverage'];
    period = json['period'];
    liveTime = json['liveTime'];
    liveTimeRemaining = json['liveTimeRemaining'];
    eventHasRanking = json['eventHasRanking'];
    important = json['important'];
    competitionId = json['competitionId'];
    competitionCallId = json['competitionCallId'];
    homeTeam =
        json['homeTeam'] != null ? Team.fromJson(json['homeTeam']) : null;
    awayTeam =
        json['awayTeam'] != null ? Team.fromJson(json['awayTeam']) : null;
    scores = json['scores'] != null ? Scores.fromJson(json['scores']) : null;
    pourcent1 = json['pourcent_1'];
    pourcent2 = json['pourcent_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['day'] = day;
    data['state'] = state;
    data['coverage'] = coverage;
    data['period'] = period;
    data['liveTime'] = liveTime;
    data['liveTimeRemaining'] = liveTimeRemaining;
    data['eventHasRanking'] = eventHasRanking;
    data['important'] = important;
    data['competitionId'] = competitionId;
    data['competitionCallId'] = competitionCallId;
    if (homeTeam != null) {
      data['homeTeam'] = homeTeam!.toJson();
    }
    if (awayTeam != null) {
      data['awayTeam'] = awayTeam!.toJson();
    }
    if (scores != null) {
      data['scores'] = scores!.toJson();
    }
    data['pourcent_1'] = pourcent1;
    data['pourcent_2'] = pourcent2;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? slug;
  Country? country;
  List<int>? tabs;

  Team({this.id, this.name, this.slug, this.country, this.tabs});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    tabs = json['tabs'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    data['tabs'] = tabs;
    return data;
  }
}

class Scores {
  Period? seven;
  Period? one;
  Period? two;
  Period? four;
  Period? five;

  Scores({this.seven});

  Scores.fromJson(Map<String, dynamic> json) {
    seven = json['7'] != null ? Period.fromJson(json['7']) : null;
    one = json['1'] != null ? Period.fromJson(json['1']) : null;
    two = json['2'] != null ? Period.fromJson(json['2']) : null;
    four = json['4'] != null ? Period.fromJson(json['4']) : null;
    five = json['5'] != null ? Period.fromJson(json['5']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (seven != null) {
      data['7'] = seven!.toJson();
    }
    if (one != null) {
      data['1'] = one!.toJson();
    }
    if (two != null) {
      data['2'] = two!.toJson();
    }
    if (four != null) {
      data['4'] = four!.toJson();
    }
    if (five != null) {
      data['5'] = five!.toJson();
    }
    return data;
  }
}

class Period {
  int? home;
  int? away;

  Period({this.home, this.away});

  Period.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['away'] = away;
    return data;
  }
}
