enum States { clean, x, o, til }

const List<List<int>> winningCombinations = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], // Filas
  [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columnas
  [0, 4, 8], [2, 4, 6], // Diagonales
];

States checkWinner(List<States> state) {
  for (var combination in winningCombinations) {
    var a = state[combination[0]];
    var b = state[combination[1]];
    var c = state[combination[2]];

    if (a == States.x && b == States.x && c == States.x) {
      return States.x; // 'X' gana
    } else if (a == States.o && b == States.o && c == States.o) {
      return States.o; // 'O' gana
    }
  }

  // Si no se encontró ninguna combinación ganadora y no hay espacios en blanco, es un empate
  if (!state.contains(States.clean)) {
    return States.til; // Empate
  }

  // Si ninguna de las condiciones anteriores se cumple, el juego aún está en curso
  return States.clean;
}

List<int> getWinningCombination(List<States> state) {
  for (var combination in winningCombinations) {
    var a = state[combination[0]];
    var b = state[combination[1]];
    var c = state[combination[2]];

    if (a == States.x && b == States.x && c == States.x) {
      return combination; // 'X' gana con esta combinación
    } else if (a == States.o && b == States.o && c == States.o) {
      return combination; // 'O' gana con esta combinación
    }
  }

  // Si no se encontró ninguna combinación ganadora y no hay espacios en blanco, es un empate
  if (!state.contains(States.clean)) {
    return []; // Empate
  }

  // Si ninguna de las condiciones anteriores se cumple, el juego aún está en curso
  return [];
}
