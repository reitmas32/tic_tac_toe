import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/providers/rival.dart';
import 'package:tic_tac_toe/ui/atoms/custom_button.dart';
import 'package:tic_tac_toe/ui/enums/rivals.dart';

class SelectTypeGame extends ConsumerWidget {
  const SelectTypeGame({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CustomButton(
          color: const Color.fromARGB(255, 242, 177, 55),
          shadowColor: const Color.fromARGB(255, 179, 119, 8),
          lable: 'NEW GAME (VS CPU)',
          onTap: () {
            ref.read(yourRivalProvider.notifier).update((state) => Rivals.cpu);
            context.go('/game');
          },
        ),
        CustomButton(
          color: const Color.fromARGB(255, 49, 195, 190),
          shadowColor: const Color.fromARGB(255, 12, 167, 161),
          lable: 'NEW GAME (VS PLAYER)',
          onTap: () {
            ref
                .read(yourRivalProvider.notifier)
                .update((state) => Rivals.human);
            context.go('/game');
          },
        ),
      ],
    );
  }
}
