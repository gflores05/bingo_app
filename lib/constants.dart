import 'package:bingo_app/definitions.dart';

Map<String, List<int>> bingoCells = {
  'B': [for (var i = 1; i <= 15; i += 1) i],
  'I': [for (var i = 16; i <= 30; i += 1) i],
  'N': [for (var i = 31; i <= 45; i += 1) i],
  'G': [for (var i = 46; i <= 60; i += 1) i],
  'O': [for (var i = 61; i <= 75; i += 1) i],
};

List<GameModeItem> gameModes = [
  GameModeItem(type: GameMode.L, title: 'L'),
  GameModeItem(type: GameMode.HORIZONTAL, title: 'Horizontal'),
  GameModeItem(type: GameMode.VERTICAL, title: 'Vertical'),
  GameModeItem(type: GameMode.CORNERS, title: 'Cuatro esquinas'),
  GameModeItem(type: GameMode.DIAGONAL, title: 'Diagonal'),
  GameModeItem(type: GameMode.X, title: 'X'),
  GameModeItem(type: GameMode.FULL, title: 'Cartilla llena'),
];
