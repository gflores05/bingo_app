Map<String, List<int>> bingoCells = {
  'B': [for (var i = 1; i <= 15; i += 1) i],
  'I': [for (var i = 16; i <= 30; i += 1) i],
  'N': [for (var i = 31; i <= 45; i += 1) i],
  'G': [for (var i = 46; i <= 60; i += 1) i],
  'O': [for (var i = 61; i <= 75; i += 1) i],
};

const List<String> gameModes = [
  'L',
  'Horizontal',
  'Vertical',
  'Cuatro esquinas',
  'Diagonal',
  'X',
  'Cartilla llena'
];
