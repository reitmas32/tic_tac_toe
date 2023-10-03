import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/ui/enums/states.dart';

final isTurnOf_X = StateProvider((ref) => true);

// True == Turn of X
final yourStateProvider = StateProvider((ref) => States.x);
