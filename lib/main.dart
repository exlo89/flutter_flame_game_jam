import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/game_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hot & Cold Runner',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hot & Cold Runner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget child = const SizedBox();
  bool gameIsRunning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: child),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                setState(() {
                  if (gameIsRunning) {
                    setState(() {
                      child = const SizedBox.shrink();
                      gameIsRunning = false;
                    });
                  } else {
                    setState(() {
                      child = GameWidget(
                        game: GameMain(),
                        overlayBuilderMap: {
                          'sliderOverlay':
                              (BuildContext context, GameMain game) {
                            return Slider(
                              value: game.sliderValue,
                              min: 0,
                              max: 100,
                              onChanged: (double newValue) {
                                setState(() {
                                  game.sliderValue = newValue;
                                });
                              },
                            );
                          },
                        },
                        initialActiveOverlays: ['sliderOverlay'],
                      );
                      gameIsRunning = true;
                    });
                  }
                });
              },
              child: Text('${gameIsRunning ? 'Stop' : 'Start'} Game'),
            ),
          ],
        ),
      ),
    );
  }
}
