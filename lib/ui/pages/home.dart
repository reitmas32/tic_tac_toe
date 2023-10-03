import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/atoms/logo.dart';
import 'package:tic_tac_toe/ui/views/body_home.dart';
import 'package:tic_tac_toe/ui/views/select_type_game.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(40.0),
            child: LogoWidget(),
          ),
          BodyHome(),
          SizedBox(
            height: 50,
          ),
          SelectTypeGame(),
        ],
      ),
    );
  }
}
