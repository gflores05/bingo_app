import 'package:flutter/material.dart';

class Bingo with ChangeNotifier {
  final Map<String, List<bool>> _currentGame = {
    'B': [for (var i = 0; i < 15; i += 1) false],
    'I': [for (var i = 0; i < 15; i += 1) false],
    'N': [for (var i = 0; i < 15; i += 1) false],
    'G': [for (var i = 0; i < 15; i += 1) false],
    'O': [for (var i = 0; i < 15; i += 1) false],
  };

  Map<String, List<bool>> get currentGame {
    return {..._currentGame};
  }
}
