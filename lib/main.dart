import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game_jam/game/my_game.dart';

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
  Widget child = const SizedBox.shrink();
  bool gameIsRunning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: child,
            ),
            const SizedBox(height: 20),
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
                      child = Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: GameWidget(game: MyGame()),
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
