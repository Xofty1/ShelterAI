import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/theme/app_colors.dart';
import '../domain/bloc/game_bloc.dart';
import '../domain/models/disaster.dart';
import 'package:shelter_ai/presentation/ui_items/app_button.dart';

import '../l10n/l10n.dart';

class LoreScreen extends StatelessWidget {
  final Disaster disaster;

  const LoreScreen({super.key, required this.disaster});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF231C08),
        title: Text(
          loc.lore,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF483728), Color(0xFF6B5642)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        _buildTopHeader(context, disaster),
                        const SizedBox(height: 24),
                        _buildParchmentContent(context, disaster),
                        const SizedBox(height: 20),
                        _buildBunkerInfo(context, disaster),
                        const SizedBox(height: 30),
                        AppButton(
                            text: loc.startGame,
                            onPressed: () {
                              BlocProvider.of<GameBloc>(context)
                                  .add(ReadyGameEvent());
                            }),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Spacer(),
          Text(
            loc.lore,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopHeader(BuildContext context, Disaster disaster) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFAA8F66),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.warning_amber,
            color: Color(0xFFE0A458),
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            disaster.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE0A458),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            disaster.disasterShortDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParchmentContent(BuildContext context, Disaster disaster) {
    return Stack(
      children: [
        // Paper texture with torn edges effect
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE3D1),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(3, 3),
                blurRadius: 6,
              ),
            ],
            // Using color gradient instead of image for compatibility
            gradient: const LinearGradient(
              colors: [Color(0xFFEDE3D1), Color(0xFFE8D8C0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "ОТЧЕТ О КАТАСТРОФЕ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B2D0E),
                  letterSpacing: 1.5,
                ),
              ),
              const Divider(
                color: Color(0xFF6B2D0E),
                thickness: 1,
              ),
              const SizedBox(height: 12),
              Text(
                disaster.disasterDescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4A3520),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        // Staple effect in the corner
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            width: 14,
            height: 14,
            decoration: const BoxDecoration(
              color: Color(0xFF888888),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBunkerInfo(BuildContext context, Disaster disaster) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3327),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF6B594A),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.shield,
                color: Color(0xFFD1A881),
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  disaster.shelterName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD1A881),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow(Icons.location_on, 'Расположение:', disaster.location),
          const SizedBox(height: 8),
          _buildInfoRow(
              Icons.people, 'Вместимость:', '${disaster.capacity} человек'),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.room, 'Помещения:', disaster.rooms.join(", ")),
          const SizedBox(height: 8),
          _buildInfoRow(
              Icons.inventory_2, 'Ресурсы:', disaster.resources.join(", ")),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              disaster.description,
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: const Color(0xFFD1A881),
          size: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2, // соотношение 1 часть для label
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD1A881),
            ),
          ),
        ),
        const SizedBox(width: 2),
        Expanded(
          flex: 3, // соотношение 2 части для value
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
