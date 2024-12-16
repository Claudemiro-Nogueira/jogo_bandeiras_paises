import 'package:flutter/material.dart';
import 'package:jogo_bandeira/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.option, required this.color});
  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          style: TextStyle(
            fontSize: 22,

            color: color.red != color.green ? neutral : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
