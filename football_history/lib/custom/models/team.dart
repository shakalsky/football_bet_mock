class Team {
  final String? name;
  final String? logo;
  final List<Player> players;
  final String? coachName;

  Team(
    this.name,
    this.logo,
    this.players,
    this.coachName,
  );

  factory Team.fromJson(Map<String, dynamic> json) {
    String? coachName;

    if (json['coaches'] != null && json['coaches'] is List) {
      if ((json['coaches'] as List).isNotEmpty) {
        coachName = (json['coaches'] as List).first['coach_name'];
      }
    }

    return Team(
      json['team_name'],
      json['team_badge'],
      json['players'].map((e) => Player.fromJson(e)).whereType<Player>().toList(),
      coachName,
    );
  }
}

class Player {
  final String? image;
  final String? name;
  final String? number;
  final String? type;
  final String? age;
  final String? matchesPlayed;
  final String? goals;
  final String? yellowCards;
  final String? redCards;
  final String? injured;
  final String? birthday;
  final String? passes;
  final String? passesAccuracy;
  final String? rating;

  Player(
    this.image,
    this.name,
    this.number,
    this.type,
    this.age,
    this.matchesPlayed,
    this.goals,
    this.yellowCards,
    this.redCards,
    this.injured,
    this.birthday,
    this.passes,
    this.passesAccuracy,
    this.rating,
  );

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      json['player_image'],
      json['player_name'],
      json['player_number'],
      json['player_type'],
      json['player_age'],
      json['player_match_played'],
      json['player_goals'],
      json['player_yellow_cards'],
      json['player_red_cards'],
      json['player_injured'],
      json['player_birthdate'],
      json['player_passes'],
      json['player_passes_accuracy'],
      json['player_rating'],
    );
  }
}
