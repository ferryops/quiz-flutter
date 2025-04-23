import 'package:flutter/material.dart';

class QuizListPage extends StatelessWidget {
  const QuizListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📋Daftar Kuis')),
      body: Center(
        child: ElevatedButton(
          child: const Text('🚀Mulai Kuis'),
          onPressed: () {
            Navigator.pushNamed(context, '/quiz');
          },
        ),
      ),
    );
  }
}
