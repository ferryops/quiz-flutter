import 'package:flutter/material.dart';
import '../data/dummy_questions.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final Map<int, dynamic> userAnswers =
        ModalRoute.of(context)?.settings.arguments as Map<int, dynamic>? ?? {};

    int totalScored = 0;
    int correctAnswers = 0;

    for (int i = 0; i < dummyQuestions.length; i++) {
      final question = dummyQuestions[i];
      final userAnswer = userAnswers[i];

      if (question.type == 'choice' || question.type == 'truefalse') {
        totalScored++;
        if (userAnswer == question.answer) {
          correctAnswers++;
        }
      }
    }

    final score =
        totalScored > 0 ? ((correctAnswers / totalScored) * 100).round() : 0;

    String getMessageForScore(int score) {
      if (score >= 90) {
        return '🔥 Gokil! Kamu emang jagoan Flutter!';
      } else if (score >= 80) {
        return '💪 Keren! Tinggal dikit lagi jadi master.';
      } else if (score >= 70) {
        return '👌 Lumayan! Tapi masih bisa ditingkatin.';
      } else if (score >= 60) {
        return '😅 Belajar dikit lagi yuk, biar makin mantap.';
      } else {
        return '📚 Ayo semangat! Pelan-pelan, nanti juga bisa.';
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Laporan Hasil Kuis')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Text(
                  'Skor Anda: $score/100',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  getMessageForScore(score),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Laporan Hasil Kuis', style: TextStyle(fontSize: 18)),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: dummyQuestions.length,
              itemBuilder: (context, index) {
                final question = dummyQuestions[index];
                final userAnswer = userAnswers[index]?.toString() ?? '-';

                return ListTile(
                  title: Text('Soal ${index + 1}: ${question.question}'),
                  subtitle: Text('Jawaban Anda: $userAnswer'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
