import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_history/custom/constants.dart';
import 'package:football_history/custom/models/team.dart';

class PlayerPage extends StatelessWidget {
  final Player player;
  const PlayerPage(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('player'),
        trailing: GestureDetector(
          onTap: () {
            Shared.favorites.add(player);
            Fluttertoast.showToast(
              msg: 'Player ${player.name} added to favorites',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              backgroundColor: const Color.fromARGB(184, 0, 0, 0),
              fontSize: 16.0,
            );
          },
          child: const Icon(
            CupertinoIcons.add,
            size: 24,
            color: Colors.blue,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                player.image == null
                    ? Container()
                    : SizedBox.square(
                        dimension: 110,
                        child: CachedNetworkImage(
                          imageUrl: player.image!,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                Column(
                  children: [
                    Text(
                      player.name ?? '',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      player.birthday ?? 'unknown birthday',
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      player.number ?? 'XX',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            _tile('Team role', player.type),
            SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _tile('Played matches count', player.matchesPlayed),
                  _tile('Goals count', player.goals),
                  _tile('Yellow cards count', player.yellowCards),
                  _tile('Red cards count', player.redCards),
                  _tile('Is injured', player.injured),
                  _tile('Passes count', player.passes),
                  _tile('Passes accuracy', player.passesAccuracy),
                  _tile('Rating', player.rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(String name, String? value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffEBF6FF),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              maxLines: 2,
              softWrap: true,
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xff8EA3B7),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 7,
                  decoration: BoxDecoration(
                    color: Color(0xff369FFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Text(
                  value?.isEmpty == true ? '-' : value ?? '-',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff006ED3),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
