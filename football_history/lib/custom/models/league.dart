class League {
  final String leagueId;
  final String? leagueName;
  final String? leagueSeason;
  final String? logo;

  League(
    this.leagueId,
    this.leagueName,
    this.leagueSeason,
    this.logo,
  );

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      json['league_id'],
      json['league_name'],
      json['league_season'],
      json['league_logo'],
    );
  }
}
