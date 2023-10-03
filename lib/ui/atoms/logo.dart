import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.height = 30});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.network(
        'https://raw.githubusercontent.com/reitmas32/tic_tac_toe/95706c36841222816f431c06c4801573632198e1/assets/logo.svg',
        height: height,
      ),
    );
  }
}
