import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/ui/molecules/custom_toggle.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 31, 54, 65),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 16, 24, 29),
              offset: Offset(
                0,
                5,
              ),
              blurStyle: BlurStyle.solid,
            ),
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text(
              'PICK PLAYER 1\'S MARK',
              style: GoogleFonts.outfit(),
            ),
          ),
          const CustomToggle(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text(
              'REMEMBER : X GOES FIRST',
              style: GoogleFonts.outfit(),
            ),
          ),
        ],
      ),
    );
  }
}
