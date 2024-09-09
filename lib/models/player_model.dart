class PlayerModel {
  int? id;
  String? name;
  String? slug;
  String? imageURL;
  String? form;
  Country? country;
  int? averageHeight;
  int? averageWeight;
  double? averageAge;
  List<PlayerList>? playerList;

  PlayerModel(
      {this.id,
      this.name,
      this.slug,
      this.imageURL,
      this.form,
      this.country,
      this.averageHeight,
      this.averageWeight,
      this.averageAge,
      this.playerList});

  PlayerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    imageURL = json['imageURL'];
    form = json['form'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    averageHeight = json['averageHeight'];
    averageWeight = json['averageWeight'];
    averageAge = json['averageAge'];
    if (json['playerList'] != null) {
      playerList = <PlayerList>[];
      json['playerList'].forEach((v) {
        playerList!.add(PlayerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['imageURL'] = imageURL;
    data['form'] = form;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    data['averageHeight'] = averageHeight;
    data['averageWeight'] = averageWeight;
    data['averageAge'] = averageAge;
    if (playerList != null) {
      data['playerList'] = playerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? imageURL;
  String? slug;

  Country({this.id, this.name, this.imageURL, this.slug});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageURL = json['imageURL'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageURL'] = imageURL;
    data['slug'] = slug;
    return data;
  }
}

class PlayerList {
  Player? player;
  int? number;
  int? arrival;
  int? role;

  PlayerList({this.player, this.number, this.arrival, this.role});

  PlayerList.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    number = json['number'];
    arrival = json['arrival'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (player != null) {
      data['player'] = player!.toJson();
    }
    data['number'] = number;
    data['arrival'] = arrival;
    data['role'] = role;
    return data;
  }
}

class Player {
  int? id;
  String? name;
  String? firstname;
  String? lastname;
  int? details;
  String? fullName;
  int? age;
  int? weight;
  int? height;
  Country? country;
  //Null? missing;

  Player({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.details,
    this.fullName,
    this.age,
    this.weight,
    this.height,
    this.country,
    //this.missing
  });

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    details = json['details'];
    fullName = json['fullName'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    // missing = json['missing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['details'] = details;
    data['fullName'] = fullName;
    data['age'] = age;
    data['weight'] = weight;
    data['height'] = height;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    //data['missing'] = missing;
    return data;
  }
}
