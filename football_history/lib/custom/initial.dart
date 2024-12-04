import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_history/custom/pages/favorites.dart';
import 'package:football_history/custom/pages/history.dart';
import 'package:football_history/custom/pages/home.dart';
import 'package:football_history/custom/pages/rules.dart';

class MockAppInitialPage extends StatelessWidget {
  const MockAppInitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Leagues',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Players',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bookmark_solid),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_fill),
            label: 'Rules',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                {
                  return HomePage();
                }
              case 1:
                {
                  return FavoritePlayers();
                }
              case 2:
                {
                  return HistoryPage();
                }
              case 3:
                {
                  return RulesPage();
                }

              default:
                {
                  return HomePage();
                }
            }
          },
        );
      },
    );
  }
}
