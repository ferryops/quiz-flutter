import 'dart:async';
import 'package:flutter/material.dart';
import '../data/dummy_questions.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  Map<int, dynamic> userAnswers = {};
  late PageController _pageController;
  late Timer _timer;
  int _remainingSeconds = 120;

  @override
  void initState() {
    _pageController = PageController();
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        _submitQuiz();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _submitQuiz() {
    _timer.cancel();
    Navigator.pushNamed(context, '/success', arguments: userAnswers);
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: Text('$minutes:$seconds')),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: dummyQuestions.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final q = dummyQuestions[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Soal ${index + 1}: ${q.question}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                if (q.type == 'choice')
                  ...q.options!.map(
                    (opt) => RadioListTile(
                      title: Text(opt),
                      value: opt,
                      groupValue: userAnswers[index],
                      onChanged: (value) {
                        setState(() {
                          userAnswers[index] = value;
                        });
                      },
                    ),
                  ),
                if (q.type == 'truefalse') ...[
                  RadioListTile(
                    title: const Text('Benar'),
                    value: true,
                    groupValue: userAnswers[index],
                    onChanged: (value) {
                      setState(() {
                        userAnswers[index] = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Salah'),
                    value: false,
                    groupValue: userAnswers[index],
                    onChanged: (value) {
                      setState(() {
                        userAnswers[index] = value;
                      });
                    },
                  ),
                ],
                if (q.type == 'essay')
                  TextField(
                    onChanged: (value) {
                      userAnswers[index] = value;
                    },
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Jawaban Anda',
                    ),
                  ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (index > 0)
                      ElevatedButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text('Sebelumnya'),
                      )
                    else
                      const SizedBox(width: 100),
                    ElevatedButton(
                      onPressed: () {
                        if (index < dummyQuestions.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          _submitQuiz();
                        }
                      },
                      child: Text(
                        index == dummyQuestions.length - 1
                            ? 'Selesai'
                            : 'Selanjutnya',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
