import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAB7844),
        title: Text(loc.history),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
        ),
        child: Center(
          child: Text(
            AppLocalizations.of(context).soonHistory,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B4F35),
            ),
            softWrap: true, // Позволяет переносу строки
            overflow: TextOverflow.visible, // Позволяет тексту расширяться вниз
          ),
        ),
      ),
    );
  }
}
