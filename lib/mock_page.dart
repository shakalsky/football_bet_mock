import 'package:bets/card.dart';
import 'package:bets/header.dart';
import 'package:bets/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class WordPracticeScreen extends StatelessWidget {
  static const String route = '/word_practice';

  final List<Word> words;

  const WordPracticeScreen({
    super.key,
    required this.words,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: HeaderWidget(
              height: 200,
              showMainIcon: true,
              showBackIcon: true,
              icon: Icons.sports_baseball_outlined,
              routeBack: () => Navigator.of(context).pop(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _StatChip(name: 'Cards count:', count: '5'),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 350.0,
              width: MediaQuery.of(context).size.width - 32.0,
              child: CardSwiper(
                cardsCount: words.length,
                cardBuilder: (context, i) => FlipCard(
                  word: words[i].word,
                  translation: words[i].translation,
                  transcription: words[i].transcription,
                  explanation: words[i].meaning.isNotEmpty ? words[i].meaning.first : null,
                  image: words[i].imageUrl,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String name;
  final String count;

  const _StatChip({
    required this.name,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                letterSpacing: 0.15,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              count,
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 0.15,
                decoration: TextDecoration.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
