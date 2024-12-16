import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jogo_bandeira/screens/result_Screen.dart';
import 'package:jogo_bandeira/gerenciarPaises.dart';
import 'package:jogo_bandeira/listaDeBandeiras.dart';
import 'package:jogo_bandeira/widgets/next_button.dart';
import 'package:jogo_bandeira/widgets/option_card.dart';
import 'package:jogo_bandeira/widgets/question_widget.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  final int tempo; // Em segundos
  const HomeScreen({super.key, required this.tempo});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Gerenciarpaises gerenciarPaises;
  late int remainingTime;
  Timer? timer;
  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool isAlreadySelected = false;

  @override
  void initState() {
    super.initState();
    gerenciarPaises = Gerenciarpaises(jsonList);
    gerenciarPaises.adicionarPais();
    gerenciarPaises.sortearPais();
    remainingTime = widget.tempo;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        navigateToResultScreen();
      }
    });
  }

  void checkAnswerAndUpdate(String value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == gerenciarPaises.nomePaisSorteado) {
        score += 50;
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      } else {
        score -= 25;
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      }
    }
  }

  void nextQuestion() {
    if (index == gerenciarPaises.resultado.length - 1) {
      timer?.cancel();
      navigateToResultScreen();
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
          gerenciarPaises.limparListaPaises();
          gerenciarPaises.adicionarPais();
          gerenciarPaises.sortearPais();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Selecione uma opção"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

  void navigateToResultScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(score: score),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text("Quizz Game", style: TextStyle(color: Color(0xFFEEEEEE))),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Score: $score",
                  style: const TextStyle(fontSize: 18, color: Color(0xFFEEEEEE)),
                ),
                const SizedBox(width: 10),
                Text(
                  "Tempo: $remainingTime s",
                  style: const TextStyle(fontSize: 18, color: Color(0xFFEEEEEE)),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              question: "", // Aqui pode-se ajustar a lógica da pergunta
              totalQuestions: gerenciarPaises.resultado.length,
              imagePath: gerenciarPaises.caminhoImagem,
            ),
            Divider(color: neutral),
            const SizedBox(height: 25),
            for (int i = 0; i < 4; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(gerenciarPaises.paises[i].nome),
                child: OptionCard(
                  option: gerenciarPaises.paises[i].nome,
                  color: isPressed
                      ? gerenciarPaises.paises[i].nome ==
                              gerenciarPaises.nomePaisSorteado
                          ? correct
                          : incorrect
                      : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: NextButton(nextQuestion: nextQuestion),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
