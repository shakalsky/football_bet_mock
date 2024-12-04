import 'package:bets/mock_page.dart';
import 'package:bets/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Initial extends StatelessWidget {
  Initial({super.key});

  final words1 = [
    const Word(
      id: 0,
      word: 'Mike Baumann 53',
      translation: '240 lbs',
      transcription: 'SP',
      meaning: ['Peoria, AZ'],
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/36724.png&h=400&w=500',
    ),
    const Word(
      id: 1,
      word: 'Felix Bautista 74',
      translation: '285 lbs',
      transcription: 'SP',
      meaning: ['Santo Domingo, Dominican Republic'],
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/40884.png&h=400&w=500',
    ),
    const Word(
      id: 2,
      word: 'Albert Abreu 84',
      translation: '190 lbs',
      meaning: ['Guayubin, Dominican Republic'],
      transcription: 'CF',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/40543.png&h=400&w=500',
    ),
    const Word(
      id: 2,
      word: 'Yennier Cano 78',
      translation: '160 lbs',
      meaning: ['Guayubin, Dominican Republic'],
      transcription: 'CF',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/4905859.png&h=400&w=500',
    ),
    const Word(
      id: 2,
      word: 'Danny Coulombe54',
      translation: '230 lbs',
      meaning: ['Guayubin, Dominican Republic'],
      transcription: 'RF',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/4311625.png&h=400&w=500',
    ),
  ];

  final words2 = [
    const Word(
      id: 0,
      word: 'Toms River, NJ',
      translation: '160 lbs',
      transcription: 'SP',
      meaning: ['Peoria, AZ'],
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/35536.png&h=400&w=500',
    ),
    const Word(
      id: 1,
      word: 'Gerrit Cole 45',
      translation: '285 lbs',
      transcription: 'SP',
      meaning: ['San Jose de las Lajas, FL'],
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/31053.png&h=400&w=500',
    ),
    const Word(
      id: 2,
      word: 'Jimmy Cordero 70',
      translation: '130 lbs',
      meaning: ['Newport Beach, CA'],
      transcription: 'CF',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/4905859.png&h=400&w=500',
    ),
    const Word(
      id: 2,
      word: 'Nestor Cortes 65',
      translation: '170 lbs',
      meaning: ['San Jose de las Lajas, FL'],
      transcription: 'CF',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/4717904.png&h=400&w=500',
    ),
    const Word(
      id: 2,
      word: 'Clay Holmes 35',
      translation: '170 lbs',
      meaning: ['Dothan, AL'],
      transcription: 'RF',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/32046.png&h=400&w=500',
    ),
  ];

  final words3 = [
    const Word(
      id: 0,
      word: '	Tanner Houck89',
      translation: '210 lbs',
      transcription: 'SP',
      meaning: ['Peoria, AZ'],
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/4720856.png&h=400&w=500',
    ),
    const Word(
      id: 1,
      word: 'Justin Garza 63',
      translation: '235 lbs',
      transcription: 'SP',
      meaning: ['St. Louis, MO'],
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/41277.png&h=400&w=500',
    ),
    const Word(
      id: 2,
      word: 'Kutter Crawford 50',
      translation: '250 lbs',
      meaning: ['Valencia, CA'],
      transcription: 'CF',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/3033851.png&h=400&w=500',
    ),
    const Word(
      id: 2,
      word: 'Brennan Bernardino 83',
      translation: '140 lbs',
      meaning: ['	Okeechobee, FL'],
      transcription: 'CF',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/41009.png&h=400&w=500',
    ),
    const Word(
      id: 2,
      word: 'Brayan Bello 66',
      translation: '240 lbs',
      meaning: ['St. Louis, MO'],
      transcription: 'RF',
      imageUrl:
          'https://a.espncdn.com/combiner/i?img=/i/headshots/mlb/players/full/29630.png&h=400&w=500',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Column(
          children: [
            const Text(
              'Baseball teams',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 8.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset('assets/ll.jpg'),
            ),
            const SizedBox(height: 40.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WordPracticeScreen(words: words1)),
                    );
                  },
                  child: const ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    tileColor: Color.fromARGB(221, 225, 225, 225),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/i_2.png'),
                      radius: 30.0,
                    ),
                    title: Text('BOSTON RED SOX'),
                    trailing: Icon(Icons.navigate_next),
                    visualDensity: VisualDensity(
                      vertical: 3,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WordPracticeScreen(words: words2)),
                    );
                  },
                  child: const ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    tileColor: Color.fromARGB(221, 225, 225, 225),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/i_3.png'),
                      radius: 30.0,
                    ),
                    title: Text('NEW YORK YANKEES'),
                    trailing: Icon(Icons.navigate_next),
                    visualDensity: VisualDensity(
                      vertical: 3,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WordPracticeScreen(words: words3)),
                    );
                  },
                  child: const ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    tileColor: Color.fromARGB(221, 225, 225, 225),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/i_1.png'),
                      radius: 30.0,
                    ),
                    title: Text('BALTIMORE ORIOLES'),
                    trailing: Icon(Icons.navigate_next),
                    visualDensity: VisualDensity(
                      vertical: 3,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
