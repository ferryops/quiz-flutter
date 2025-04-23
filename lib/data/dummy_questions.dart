import '../models/question_model.dart';

List<Question> dummyQuestions = [
  // Umum
  Question(
    question: 'Apa ibu kota Indonesia?',
    type: 'choice',
    options: ['Jakarta', 'Bandung', 'Surabaya'],
    answer: 'Jakarta',
  ),
  Question(
    question: 'Benar atau salah: Flutter dikembangkan oleh Apple?',
    type: 'truefalse',
    answer: false,
  ),
  Question(question: 'Jelaskan apa itu widget di Flutter.', type: 'essay'),

  // Flutter & Mobile
  Question(
    question: 'Widget mana yang digunakan untuk layout vertikal?',
    type: 'choice',
    options: ['Row', 'Column', 'Stack'],
    answer: 'Column',
  ),
  Question(
    question: 'StatefulWidget dapat menyimpan perubahan UI secara dinamis.',
    type: 'truefalse',
    answer: true,
  ),
  Question(
    question: 'Perintah untuk membuat proyek Flutter baru adalah...',
    type: 'essay',
  ),
  Question(
    question: 'Apa fungsi dari setState() dalam StatefulWidget?',
    type: 'essay',
  ),
  Question(
    question: 'Widget apa yang cocok untuk scrollable list?',
    type: 'choice',
    options: ['ListView', 'Container', 'TextField'],
    answer: 'ListView',
  ),
  Question(
    question: 'Flutter menggunakan bahasa pemrograman apa?',
    type: 'choice',
    options: ['Java', 'Kotlin', 'Dart'],
    answer: 'Dart',
  ),
  Question(
    question: 'Navigator digunakan untuk berpindah antar halaman di Flutter.',
    type: 'truefalse',
    answer: true,
  ),
  Question(
    question: 'Jelaskan perbedaan Stateless dan Stateful Widget.',
    type: 'essay',
  ),
  Question(
    question: 'Apa yang dimaksud dengan "hot reload" di Flutter?',
    type: 'essay',
  ),
  Question(
    question: 'Widget yang digunakan untuk membuat tombol adalah...',
    type: 'choice',
    options: ['ElevatedButton', 'Scaffold', 'AppBar'],
    answer: 'ElevatedButton',
  ),
];
