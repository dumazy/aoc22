const win = 6;
const draw = 3;
const loss = 0;

const x = 1;
const y = 2;
const z = 3;

class Puzzle1 {
  final String input;

  Puzzle1(this.input);

  int execute() {
    List<String> games = input.split('\n');
    return games
        .map(calculateScore)
        .reduce((value, element) => value + element);
  }

  int calculateScore(String game) {
    final moves = game.split(' ');
    final opponent = moves.first;
    final you = moves.last;

    final total = pointsForGame(opponent, you) + pointsForMove(you);
    return total;
  }

  int pointsForGame(String opponent, String you) {
    final opponentIndex = 'ABC'.indexOf(opponent);
    final yourIndex = 'XYZ'.indexOf(you);

    if (yourIndex == 0 && opponentIndex == 2) return win;
    if (opponentIndex == 0 && yourIndex == 2) return loss;
    if (opponentIndex == yourIndex) return draw;
    if (yourIndex > opponentIndex) return win;
    return loss;
  }

  int pointsForMove(String move) {
    return 'XYZ'.indexOf(move) + 1;
  }
}
