// import 'package:flutter/material.dart';
// import 'package:jogo_bandeira/constants.dart';

// class QuestionWidget extends StatelessWidget {
//   const QuestionWidget(
//       {super.key,
//       required this.question,
//       required this.indexAction,
//       required this.totalQuestions});

//   final String question;
//   final int indexAction;
//   final int totalQuestions;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.centerLeft,
//       child: Text("Questões ${indexAction + 1}/$totalQuestions: $question",
//           style: TextStyle(fontSize: 24.0, color: neutral)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:jogo_bandeira/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question,
    required this.indexAction,
    required this.totalQuestions,
    required this.imagePath,
  });

  final String question;
  final int indexAction;
  final int totalQuestions;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget de imagem
          Image.asset(
            imagePath,
            height: 150.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10.0),
          // Widget de texto
          Text(
            "              ${indexAction + 1}/$totalQuestions $question",
            style: TextStyle(fontSize: 24.0, color: neutral),
          ),
        ],
      ),
    );
  }
}
