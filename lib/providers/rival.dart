// True == Turn of X
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/ui/enums/rivals.dart';

final yourRivalProvider = StateProvider((ref) => Rivals.cpu);
