import 'package:flutter/material.dart';
import 'pages/quiz_list_page.dart';
import 'pages/quiz_page.dart';
import 'pages/success_page.dart';
import 'pages/report_page.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kuis Pengoding Handal',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizListPage(),
        '/quiz': (context) => const QuizPage(),
        '/success': (context) => const SuccessPage(),
        '/report': (context) => const ReportPage(),
      },
    );
  }
}
