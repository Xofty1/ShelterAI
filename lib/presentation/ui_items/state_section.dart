import 'package:flutter/cupertino.dart';

class StateSection extends StatelessWidget {
  final String title;
  final String content;
  const StateSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B5642),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF5A503F),
          ),
        ),
      ],
    );
  }
}
