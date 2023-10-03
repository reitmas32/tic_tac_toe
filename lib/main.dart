import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/tic_tac_toe.dart';

main() => runApp(const ProviderScope(child: TicTacToeApp()));
