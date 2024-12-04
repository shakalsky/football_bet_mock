import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_history/custom/models/team.dart';
import 'package:football_history/custom/pages/player.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PlayersPage extends StatelessWidget {
  final List<Player> players;
  final String? teamName;
  PlayersPage(this.players, this.teamName, {super.key});
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('$teamName players'),
      ),
      child: Center(
        child: players.isNotEmpty
            ? GridView.builder(
                itemCount: players.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 16 / 7,
                  crossAxisCount: 1,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (_) => PlayerPage(players[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/box${random.nextInt(4) + 1}.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Text(
                                      players[index].name ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    players[index].birthday ?? '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    players[index].number ?? '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                ],
                              ),
                              players[index].image == null
                                  ? Container()
                                  : ClipOval(
                                      child: SizedBox.square(
                                        dimension: 90,
                                        child: CachedNetworkImage(
                                          imageUrl: players[index].image!,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Image.asset(
                                            'assets/unknown.jpg',
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : LoadingAnimationWidget.bouncingBall(
                color: Colors.black,
                size: 50,
              ),
      ),
    );
  }
}
