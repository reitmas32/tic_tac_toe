import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/providers/board.dart';
import 'package:tic_tac_toe/providers/rival.dart';
import 'package:tic_tac_toe/providers/stats.dart';
import 'package:tic_tac_toe/providers/turn.dart';
import 'package:tic_tac_toe/ui/enums/rivals.dart';
import 'package:tic_tac_toe/ui/enums/states.dart';
import 'package:tic_tac_toe/ui/molecules/cell_of_board.dart';
import 'package:tic_tac_toe/ui/views/app_bar_game.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 600,
          height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarGame(),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: BoardGrid(),
              ),
              StatsSection()
            ],
          ),
        ),
      ),
    );
  }
}

class StatsSection extends ConsumerWidget {
  const StatsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final youState = ref.watch(yourStateProvider);
    final youWinnerCount = ref.watch(youWinnerCountProvider);
    final youLoserCount = ref.watch(youLoserCountProvider);
    final tiesCount = ref.watch(tiesCountProvider);
    final yourRival = ref.watch(yourRivalProvider);
    final rivalName = yourRival == Rivals.cpu ? 'CPU' : 'HUMAN';
    return Row(
      children: [
        ContainerInfo(
          color: const Color.fromARGB(255, 49, 195, 189),
          lable: 'X (${youState == States.x ? 'YOU' : rivalName})',
          stats: youState == States.x ? youWinnerCount : youLoserCount,
        ),
        ContainerInfo(
          color: const Color.fromARGB(255, 219, 232, 237),
          lable: 'TIES',
          stats: tiesCount,
        ),
        ContainerInfo(
          color: const Color.fromARGB(255, 255, 200, 96),
          lable: 'O (${youState != States.x ? 'YOU' : rivalName})',
          stats: youState != States.x ? youWinnerCount : youLoserCount,
        ),
      ],
    );
  }
}

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({
    super.key,
    required this.color,
    required this.lable,
    required this.stats,
  });

  final Color color;
  final String lable;
  final int stats;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              lable,
              style: GoogleFonts.outfit(
                color: const Color.fromARGB(255, 26, 42, 51),
                fontSize: 17,
              ),
            ),
            Text(
              '$stats',
              style: GoogleFonts.outfit(
                color: const Color.fromARGB(255, 26, 42, 51),
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BoardGrid extends ConsumerStatefulWidget {
  const BoardGrid({super.key});

  @override
  ConsumerState<BoardGrid> createState() => _BoardGridState();
}

class _BoardGridState extends ConsumerState<BoardGrid> {
  @override
  Widget build(BuildContext context) {
    final states = ref.watch(boardProvider);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Número de columnas
      ),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        // Aquí puedes personalizar cada celda del grid
        return CellOfBoard(
          state: states[index],
          index: index,
        );
      },
    );
  }
}
