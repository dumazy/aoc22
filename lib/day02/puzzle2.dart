const win = 6;
const draw = 3;
const loss = 0;

const x = 1;
const y = 2;
const z = 3;

const points = [loss, draw, win];

class Puzzle2 {
  final String input;

  Puzzle2(this.input);

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

    final gamePoints = pointsForGame(you);
    final moveIndex = moveIndexForPoints('ABC'.indexOf(opponent), gamePoints);
    final total = gamePoints + moveIndex + 1;
    return total;
  }

  int pointsForGame(String you) {
    return points['XYZ'.indexOf(you)];
  }

  int moveIndexForPoints(int opponentIndex, int points) {
    switch (points) {
      case loss:
        return indexForLose(opponentIndex);
      case draw:
        return opponentIndex;
      case win:
        return indexForWin(opponentIndex);
      default:
        throw "Unknown amount of game points";
    }
  }

  int indexForLose(int opponent) {
    if (opponent == 0) return 2;
    return opponent - 1;
  }

  int indexForWin(int opponent) {
    if (opponent == 2) return 0;
    return opponent + 1;
  }
}
