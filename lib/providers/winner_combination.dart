import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/ui/enums/states.dart';

class WinnerCombination extends StateNotifier<List<int>> {
  // We initialize the list of todos to an empty list
  WinnerCombination() : super([]);

  bool setState(List<int> newState) {
    state = [...newState];
    return true;
  }

  bool clear() {
    state = [];

    return true;
  }
}

final winnerCombinationProvider =
    StateNotifierProvider<WinnerCombination, List<int>>((ref) {
  return WinnerCombination();
});
