import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/providers/board.dart';
import 'package:tic_tac_toe/providers/turn.dart';
import 'package:tic_tac_toe/providers/winner_combination.dart';
import 'package:tic_tac_toe/ui/atoms/custom_button.dart';
import 'package:tic_tac_toe/ui/atoms/logo.dart';

class AppBarGame extends StatelessWidget {
  const AppBarGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: const LogoWidget(
            height: 35,
          ),
          onTap: () => context.go('/'),
        ),
        const InfoStateGame(),
        const ResetGameButton()
      ],
    );
  }
}

class ResetGameButton extends ConsumerStatefulWidget {
  const ResetGameButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetGameButtonState();
}

class _ResetGameButtonState extends ConsumerState<ResetGameButton> {
  onReset() {
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
                  'RESTART GAME?',
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
                      lable: 'NO, CANCEL',
                      width: 250,
                      fontSize: 25,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      borderRadius: BorderRadius.circular(25),
                      onTap: () => Navigator.pop(context),
                    ),
                    CustomButton(
                      color: const Color.fromARGB(255, 242, 177, 55),
                      shadowColor: const Color.fromARGB(255, 179, 119, 8),
                      lable: 'YES, RESTART',
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
    return InkWell(
      onTap: () {
        onReset();
        //ref.read(boardProvider.notifier).clear();
        //ref.read(isTurnOf_X.notifier).update((state) => true);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 168, 191, 201),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 138, 146, 150),
              offset: Offset(
                0,
                5,
              ),
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),
        child: SvgPicture.network(
          'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-restart.svg',
          height: 20,
        ),
      ),
    );
  }
}

class InfoStateGame extends ConsumerWidget {
  const InfoStateGame({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool _isTurnOf_X = ref.watch(isTurnOf_X);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 31, 54, 65),
        borderRadius: BorderRadius.circular(5),
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
      child: Row(
        children: [
          SvgPicture.network(
            _isTurnOf_X
                ? 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-x-ligth.svg'
                : 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-o-ligth.svg',
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'TURN',
              style: GoogleFonts.outfit(
                color: const Color.fromARGB(255, 168, 191, 201),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
