import 'package:flutter/material.dart';

class PlayerCardScreen extends StatefulWidget {
  const PlayerCardScreen({super.key});

  @override
  State<PlayerCardScreen> createState() => _PlayerCardScreenState();
}

class _PlayerCardScreenState extends State<PlayerCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7C6854),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildCardContent(),
            const SizedBox(height: 16),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFB69165),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'РАУНД',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF562B27),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF562B27),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              '2',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB69165),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _buildTimerAndMenu(),
              _buildPlayerNameAndProfession(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildCharacteristic('Возраст', Icons.person),
                          _buildCharacteristic('Здоровье', Icons.favorite),
                          _buildCharacteristic('Хобби/Навыки', Icons.sports_basketball),
                          _buildCharacteristic('Фобии', Icons.warning_rounded, isSelected: true),
                          _buildCharacteristic('Багаж', Icons.cases),
                          _buildCharacteristic('Дополнительная информация', Icons.info),
                          _buildConfirmButton(),
                        ],
                      ),
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

  Widget _buildTimerAndMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE9E3D5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF562B27), width: 3),
            ),
            child: const Text(
              '00:30',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF562B27),
              ),
            ),
          ),
          const SizedBox(width: 32),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFFD48043),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'МЕНЮ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerNameAndProfession() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Имя',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Профессия',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFFA67F4E),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCharacteristic(String title, IconData icon, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5A4A3A),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFC9B38A) : const Color(0xFFE5E1DD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFC9B38A) : const Color(0xFFE5E1DD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF562B27),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        '...',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFC9B38A) : const Color(0xFFE5E1DD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          color: Color(0xFF562B27),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFFA67343),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Подтвердить выбор',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Выберите 2 характеристики',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5A4A3A),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFBF7639),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'СЮЖЕТ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 