import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/ibong_adarna_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final IbongAdarna game;

  const GameOverScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: const Color.fromARGB(96, 0, 0, 0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Score: ${game.bird.score}',
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(Assets.gameOver),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestart,
                style: ButtonStyle(elevation:MaterialStatePropertyAll(10),backgroundColor: MaterialStatePropertyAll( Color.fromARGB(255, 3, 243, 131),)),
                child: const Text(
                  'Ulitin Mo Nalang',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      );

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
