import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(RockPaperScissorsApp());
}

class RockPaperScissorsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: rockpaperscissors(),
    );
  }
}

class rockpaperscissors extends StatefulWidget {
  @override
  _rockpaperscissorsstate createState() => _rockpaperscissorsstate();
}

class _rockpaperscissorsstate extends State<rockpaperscissors> {
  final List<String> choices = ['Rock', 'Paper', 'Scissors'];
  String user = '';
  String bot = '';
  String results = '';

  void playGame(String userPick) {
    user = userPick;
    bot = choices[Random().nextInt(choices.length)];
    if (user == bot) {
      results = "It's a Draw!";
    } else if ((user == 'Rock' && bot == 'Scissors') ||
        (user == 'Paper' && bot == 'Rock') ||
        (user == 'Scissors' && bot == 'Paper')) {
      results = 'You Win!';
    } else {
      results = 'You Lose!';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock Papers Scissors'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'choose ur move',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: choices.map((choice) {
                return ElevatedButton(
                  onPressed: () => playGame(choice),
                  child: Text(choice),
                );
              }).toList(),
            ),
            SizedBox(height: 40),
            Text(
              'user choice: $user',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Bot choice: $bot",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              results,
              style: TextStyle(
                fontSize: 24,
                color: results == 'You Win!'
                    ? Colors.green
                    : results == 'You Lose!'
                        ? Colors.red
                        : Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
