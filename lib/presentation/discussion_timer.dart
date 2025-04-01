import 'package:flutter/material.dart';
import 'dart:async';

class DiscussionTimer extends StatefulWidget {
  final int durationInSeconds;
  final VoidCallback? onTimerComplete;
  final VoidCallback? onSkip;

  const DiscussionTimer({
    Key? key,
    required this.durationInSeconds,
    this.onTimerComplete,
    this.onSkip,
  }) : super(key: key);

  @override
  State<DiscussionTimer> createState() => _DiscussionTimerState();
}

class _DiscussionTimerState extends State<DiscussionTimer> {
  late Timer _timer;
  late int _currentSeconds;

  @override
  void initState() {
    super.initState();
    _currentSeconds = widget.durationInSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentSeconds > 0) {
          _currentSeconds--;
        } else {
          _timer.cancel();
          widget.onTimerComplete?.call();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.pets,
                    color: _currentSeconds <= 30 ? Colors.red : Colors.orange,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Время на обсуждение',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () {
                  _timer.cancel();
                  widget.onSkip?.call();
                },
                icon: const Icon(Icons.skip_next, color: Colors.orange),
                label: const Text(
                  'Пропустить',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.orange.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Text(
              _formatTime(_currentSeconds),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: _currentSeconds <= 30 ? Colors.red : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          if (_currentSeconds <= 30) ...[
            const SizedBox(height: 8),
            Text(
              'Осталось совсем немного!',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
