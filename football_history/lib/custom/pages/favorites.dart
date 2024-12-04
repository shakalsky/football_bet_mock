import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_history/custom/constants.dart';
import 'package:football_history/custom/pages/player.dart';

class FavoritePlayers extends StatelessWidget {
  const FavoritePlayers({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Favorite players'),
      ),
      child: Center(
        child: Shared.favorites.isEmpty
            ? const Text(
                'add your favorite players',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  itemCount: Shared.favorites.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 5,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (_) => PlayerPage(Shared.favorites.elementAt(index)),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      Shared.favorites.elementAt(index).name ?? '',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                    Text(
                                      Shared.favorites.elementAt(index).number ?? '',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Shared.favorites.elementAt(index).image == null
                                  ? Container()
                                  : Center(
                                      child: CachedNetworkImage(
                                        imageUrl: Shared.favorites.elementAt(index).image!,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
