import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> data;
  SummaryItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = data['correct_answer'] == data['user_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
              isCorrect: isCorrect, index: data['question_index'] as int),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (data['question']).toString(),
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 103, 103, 103),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Answer: ' + (data['correct_answer']).toString(),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 103, 103, 103),
                  ),
                ),
                Text(
                  'Your answer: ' + (data['user_answer']).toString(),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 103, 103, 103),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
