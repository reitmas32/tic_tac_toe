import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/providers/board.dart';
import 'package:tic_tac_toe/providers/rival.dart';
import 'package:tic_tac_toe/providers/stats.dart';
import 'package:tic_tac_toe/providers/turn.dart';
import 'package:tic_tac_toe/providers/winner_combination.dart';
import 'package:tic_tac_toe/ui/atoms/custom_button.dart';
import 'package:tic_tac_toe/ui/enums/rivals.dart';
import 'package:tic_tac_toe/ui/enums/states.dart';

class CellOfBoard extends ConsumerStatefulWidget {
  const CellOfBoard({
    super.key,
    required this.state,
    required this.index,
  });

  final States state;
  final int index;

  @override
  ConsumerState<CellOfBoard> createState() => _CellOfBoardState();
}

class _CellOfBoardState extends ConsumerState<CellOfBoard> {
  bool isClicked = false;

  onTil() {
    ref.read(tiesCountProvider.notifier).update((state) => ++state);
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(1),
        child: Container(
          height: 300,
          width: double.maxFinite,
          color: const Color.fromARGB(255, 26, 42, 51),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ROUND TIED',
                  style: GoogleFonts.outfit(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 168, 191, 201),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      color: const Color.fromARGB(255, 168, 191, 201),
                      shadowColor: const Color.fromARGB(255, 131, 146, 153),
                      lable: 'QUIT',
                      width: 250,
                      fontSize: 25,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      borderRadius: BorderRadius.circular(25),
                      onTap: () => Navigator.pop(context),
                    ),
                    CustomButton(
                      color: const Color.fromARGB(255, 242, 177, 55),
                      shadowColor: const Color.fromARGB(255, 179, 119, 8),
                      lable: 'NEXT ROUND',
                      width: 250,
                      fontSize: 25,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        ref.read(boardProvider.notifier).clear();
                        ref.read(isTurnOf_X.notifier).update((state) => true);
                        ref.watch(winnerCombinationProvider.notifier).clear();
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onWing(States winner) {
    final youState = ref.read(yourStateProvider);

    final message = youState == winner ? 'YOU WON!' : 'OH NO, YOU LOST...';

    if (youState == winner) {
      ref.read(youWinnerCountProvider.notifier).update((state) => ++state);
    } else {
      ref.read(youLoserCountProvider.notifier).update((state) => ++state);
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(1),
        child: Container(
          height: 300,
          width: double.maxFinite,
          color: const Color.fromARGB(255, 26, 42, 51),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  message,
                  style: GoogleFonts.outfit(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 168, 191, 201),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      winner == States.x
                          ? 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-x.svg'
                          : 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-o.svg',
                      height: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'TAKES THE ROUND',
                      style: GoogleFonts.outfit(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: winner == States.x
                            ? const Color.fromARGB(255, 49, 195, 189)
                            : const Color.fromARGB(255, 242, 177, 55),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      color: const Color.fromARGB(255, 168, 191, 201),
                      shadowColor: const Color.fromARGB(255, 131, 146, 153),
                      lable: 'QUIT',
                      width: 250,
                      fontSize: 25,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      borderRadius: BorderRadius.circular(25),
                      onTap: () => Navigator.pop(context),
                    ),
                    CustomButton(
                      color: const Color.fromARGB(255, 242, 177, 55),
                      shadowColor: const Color.fromARGB(255, 179, 119, 8),
                      lable: 'NEXT ROUND',
                      width: 250,
                      fontSize: 25,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        ref.read(boardProvider.notifier).clear();
                        ref.read(isTurnOf_X.notifier).update((state) => true);
                        ref.watch(winnerCombinationProvider.notifier).clear();
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final winnerCells = ref.watch(winnerCombinationProvider);
    final bool cellOfWinner = winnerCells.contains(widget.index);
    final board = ref.read(boardProvider);
    States winner = checkWinner(board);
    return Container(
      decoration: BoxDecoration(
        color: !cellOfWinner
            ? const Color.fromARGB(255, 31, 54, 65)
            : winner == States.x
                ? const Color.fromARGB(255, 49, 195, 189)
                : const Color.fromARGB(255, 242, 177, 55),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 16, 24, 29),
            offset: Offset(
              0,
              5,
            ),
            blurStyle: BlurStyle.solid,
          ),
        ],
      ),
      margin: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          setState(() {
            final result =
                ref.read(boardProvider.notifier).setCell(widget.index);
            if (!result) {
              return;
            }
            ref.read(isTurnOf_X.notifier).update((state) => !state);
            aiGame();
          });
        },
        child: Center(
          child: widget.state == States.clean
              ? null
              : SvgPicture.network(
                  cellOfWinner
                      ? widget.state == States.x
                          ? 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-x-dark.svg'
                          : 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-o-dark.svg'
                      : widget.state == States.x
                          ? 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-x.svg'
                          : 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-o.svg',
                ),
        ),
      ),
    );
  }

  aiGame() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final rival = ref.read(yourRivalProvider);
    if (rival == Rivals.cpu) {
      final board = ref.read(boardProvider);
      final indexClean = getCleanIndices(board);
      if (indexClean.isNotEmpty) {
        Random random = Random();
        ref
            .read(boardProvider.notifier)
            .setCell(indexClean[random.nextInt(indexClean.length)]);
      }
    }
    final board = ref.read(boardProvider);
    States winner = checkWinner(board);
    switch (winner) {
      case States.o || States.x:
        ref
            .read(winnerCombinationProvider.notifier)
            .setState(getWinningCombination(board));
        onWing(winner);

        break;
      case States.til:
        onTil();
        break;
      case States.clean:
        break;
      default:
    }
  }

  List<int> getCleanIndices(List<States> state) {
    List<int> cleanIndices = [];

    for (int i = 0; i < state.length; i++) {
      if (state[i] == States.clean) {
        cleanIndices.add(i);
      }
    }

    return cleanIndices;
  }
}
