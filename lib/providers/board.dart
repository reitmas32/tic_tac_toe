import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/ui/enums/states.dart';

class Board extends StateNotifier<List<States>> {
  bool isTurnOf_X = true;
  // We initialize the list of todos to an empty list
  Board()
      : super([
          States.clean,
          States.clean,
          States.clean,
          States.clean,
          States.clean,
          States.clean,
          States.clean,
          States.clean,
          States.clean,
        ]);

  bool setCell(int index) {
    if (index < 0 || index >= state.length) {
      return false;
    }

    if (state[index] != States.clean) {
      return false;
    }

    if (isTurnOf_X) {
      state[index] = States.x;
    } else {
      state[index] = States.o;
    }

    isTurnOf_X = !isTurnOf_X;

    state = [...state];

    return true;
  }

  States getCurrentTurn() {
    if (isTurnOf_X) {
      return States.x;
    }
    return States.o;
  }

  bool clear() {
    isTurnOf_X = true;
    state = [
      States.clean,
      States.clean,
      States.clean,
      States.clean,
      States.clean,
      States.clean,
      States.clean,
      States.clean,
      States.clean,
    ];

    return true;
  }
}

final boardProvider = StateNotifierProvider<Board, List<States>>((ref) {
  return Board();
});
