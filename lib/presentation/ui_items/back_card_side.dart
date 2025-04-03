import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import 'asset_image_item.dart';

class PlayerCardBack extends StatelessWidget {
  const PlayerCardBack({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AssetImageItem(
          imagePath: "assets/images/door.svg",
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 20),
        Text(
          loc.pressToSeeCard,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}