import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil userAnswers dari argument saat navigasi dari kuis
    final Map<int, dynamic> userAnswers =
        ModalRoute.of(context)?.settings.arguments as Map<int, dynamic>? ?? {};

    return Scaffold(
      appBar: AppBar(title: const Text('Berhasil Submit Kuis')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Mantap🥳, kuis kamu berhasil disubmit!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kirim userAnswers ke halaman report
                Navigator.pushNamed(context, '/report', arguments: userAnswers);
              },
              child: const Text('🫣Lihat Report'),
            ),
          ],
        ),
      ),
    );
  }
}
