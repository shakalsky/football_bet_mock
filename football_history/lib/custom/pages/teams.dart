import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_history/custom/constants.dart';
import 'package:football_history/custom/models/league.dart';
import 'package:football_history/custom/models/team.dart';
import 'package:football_history/custom/pages/player.dart';
import 'package:football_history/custom/pages/players.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TeamsPage extends StatefulWidget {
  //final String leagueId;
  final String leagueName;

  const TeamsPage(this.leagueName, {super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  final dio = Dio();
  final List<Team> teams = [];
  @override
  void initState() {
    getHttp();
    super.initState();
  }

  void getHttp() async {
    final response = await rootBundle.loadString('assets/data/${widget.leagueName}.json');

    setState(() {
      teams.addAll(json.decode(response).map((e) => Team.fromJson(e)).whereType<Team>().toList());
    });

    // final response = await dio.get(
    //   'https://apiv3.apifootball.com/?action=get_teams&league_id=${widget.leagueId}&APIkey=${Constants.apiKey}',
    // );

    // setState(() {
    //   teams.addAll(response.data.map((e) => Team.fromJson(e)).whereType<Team>().toList());
    // });
  }

  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.leagueName),
      ),
      child: Center(
        child: teams.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: teams.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (_) => PlayersPage(teams[index].players, teams[index].name),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/box${random.nextInt(4) + 1}.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    teams[index].name ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Coach: ${teams[index].coachName}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  teams[index].logo == null
                                      ? Container()
                                      : SizedBox.square(
                                          dimension: 110,
                                          child: CachedNetworkImage(
                                            imageUrl: teams[index].logo!,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget: (context, url, error) =>
                                                const Icon(Icons.error),
                                          ),
                                        )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : LoadingAnimationWidget.bouncingBall(
                color: Colors.black,
                size: 50,
              ),
      ),
    );
  }
}
