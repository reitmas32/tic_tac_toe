import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/providers/turn.dart';
import 'package:tic_tac_toe/ui/enums/states.dart';

class CustomToggle extends ConsumerStatefulWidget {
  const CustomToggle({super.key});

  @override
  ConsumerState<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends ConsumerState<CustomToggle> {
  bool positive = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: positive,
      first: false,
      second: true,
      spacing: 0.0,
      style: const ToggleStyle(
        borderColor: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0,
            //blurRadius: 2,
          ),
        ],
      ),
      borderWidth: 5.0,
      height: 55,
      onChanged: (b) {
        setState(() => positive = b);
        ref.read(yourStateProvider.notifier).update((state) {
          if (b) {
            return States.x;
          }
          return States.o;
        });
      },
      styleBuilder: (b) => ToggleStyle(
        backgroundColor: const Color.fromARGB(255, 26, 42, 51),
        indicatorColor: const Color.fromARGB(255, 168, 191, 201),
        borderRadius: BorderRadius.circular(5),
        indicatorBorderRadius: BorderRadius.circular(b ? 5.0 : 5.0),
      ),
      iconBuilder: (value) => SizedBox(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.network(
            value
                ? 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-x-dark.svg'
                : 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-o-dark.svg',
          ),
        ),
      ),
      textBuilder: (value) => SvgPicture.network(
        value
            ? 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-o-ligth.svg'
            : 'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/4813b7d7c98f7a10ced939921ae48513cd136629/assets/icon-x-ligth.svg',
      ),
    );
  }
}
