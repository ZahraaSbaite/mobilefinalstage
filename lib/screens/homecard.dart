import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title Details',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'This screen shows more information about the selected section. '
              'Here, you could list services, show charts, display messages, or anything relevant to the section.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Placeholder(
              fallbackHeight: 200,
              color: Colors.green,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
