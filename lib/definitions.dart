enum GameMode {
  NONE,
  L,
  HORIZONTAL,
  VERTICAL,
  CORNERS,
  DIAGONAL,
  X,
  FULL,
}

class GameModeItem {
  GameMode type = GameMode.NONE;
  String title = '';

  GameModeItem({required this.type, required this.title});
}
