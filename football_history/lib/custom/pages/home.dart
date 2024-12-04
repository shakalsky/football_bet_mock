import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_history/custom/constants.dart';
import 'package:football_history/custom/models/league.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:football_history/custom/pages/teams.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  final List<League> leagues = [];
  @override
  void initState() {
    getHttp();
    super.initState();
  }

  void getHttp() async {
    // final response = await dio.get(
    //   'https://apiv3.apifootball.com/?action=get_leagues&country_id=6&APIkey=${Constants.apiKey}',
    // );
    final response = await rootBundle.loadString('assets/data/content.json');
    setState(() {
      leagues.addAll(
          json.decode(response).map((e) => League.fromJson(e)).whereType<League>().toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Leagues'),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '2022-2024\nfootball leagues:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const Divider(
              height: 60,
              thickness: 5,
              color: Colors.black,
              indent: 40,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: leagues.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (_) => TeamsPage(i.leagueName!),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                width: double.maxFinite,
                                child: Center(
                                  child: SizedBox.square(
                                    dimension: MediaQuery.of(context).size.width / 3,
                                    child: i.logo == null
                                        ? Container()
                                        : CachedNetworkImage(
                                            imageUrl: i.logo!,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget: (context, url, error) =>
                                                const Icon(Icons.error),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text(
                                    '${i.leagueName}',
                                    style: const TextStyle(fontSize: 36.0, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'season: ${i.leagueSeason}',
                                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const Divider(
              height: 60,
              thickness: 5,
              color: Colors.black,
              endIndent: 40,
            ),
          ],
        ));
  }
}
