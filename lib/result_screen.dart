import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> selectedAnswers;
  final void Function() onRestart;
  const ResultScreen(this.selectedAnswers, this.onRestart, {super.key});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    int totalQuestions = questions.length;
    int correctQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(253, 220, 220, 220),
        ),
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'You have answered $correctQuestions out of $totalQuestions correctly!',
                style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 103, 103, 103),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData: summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 85, 85, 85),
                  foregroundColor: Colors.amber[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
                icon: const Icon(Icons.refresh),
                label: Text(
                  'Restart Quiz!',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.amber[50],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
