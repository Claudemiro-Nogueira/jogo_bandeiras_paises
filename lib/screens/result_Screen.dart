import 'package:flutter/material.dart';
import 'package:jogo_bandeira/constants.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    String message;
    Color color;

    if(score == 0){
      message = "Normal!";
      color = neutral;
    }
    else if (score < 0) {
      message = "Estude mais!";
      color = Colors.red;
    } else if (score <= 200) {
      message = "Muito bem!";
      color = Colors.orange;
    } else {
      message = "Você é fera!";
      color = Colors.green;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 46, 106),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Seu Score: $score",
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Jogar Novamente',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
