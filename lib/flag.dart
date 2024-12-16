import 'dart:io';
import 'package:flutter/material.dart';

class RandomFlagWidget extends StatelessWidget {
  final String imagePath;
  final String countryName;

  const RandomFlagWidget({
    super.key,
    required this.imagePath,
    required this.countryName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.file(
          File(imagePath), // Caminho para a imagem no sistema
          width: 200,
          height: 200,
          fit: BoxFit.contain, // Ajuste da imagem
        ),
        const SizedBox(height: 10),
        Text(
          countryName, // Nome da bandeira
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
