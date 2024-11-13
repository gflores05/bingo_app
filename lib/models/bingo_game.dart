import '../definitions.dart';

Map<String, List<bool>> clearGame = {
  'B': [for (var i = 0; i < 15; i += 1) false],
  'I': [for (var i = 0; i < 15; i += 1) false],
  'N': [for (var i = 0; i < 15; i += 1) false],
  'G': [for (var i = 0; i < 15; i += 1) false],
  'O': [for (var i = 0; i < 15; i += 1) false],
};

class BingoGame {
  GameMode type = GameMode.NONE;
  Map<String, List<bool>> table = clearGame;

  BingoGame({required this.type});

  Map<String, Object> toDoc() {
    return {'type': type.index, 'last': '', 'spinning': false, ...table};
  }
}
