import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  final bool isCorrect;
  final int index;
  const QuestionIdentifier(
      {super.key, required this.isCorrect, required this.index});

  @override
  Widget build(BuildContext context) {
    final questionNumber = index + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
