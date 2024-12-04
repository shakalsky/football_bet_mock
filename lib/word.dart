enum Difficulty { low, medium, high }

enum Status { initial, learning, learnt }

class Word {
  final int id;
  final String word;
  final String translation;
  final String imageUrl;
  final String? transcription;
  final List<String> meaning;
  final Difficulty difficulty;
  final Status status;

  const Word({
    required this.id,
    required this.word,
    required this.translation,
    required this.imageUrl,
    required this.meaning,
    this.transcription,
    this.difficulty = Difficulty.low,
    this.status = Status.initial,
  });
}
