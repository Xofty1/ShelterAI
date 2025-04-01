import 'package:flutter/material.dart';
import 'dart:async';

class CustomTimer extends StatefulWidget {
  final int initialSeconds;
  final Function(int)? onTick;
  final Function()? onComplete;
  final bool showControls;

  const CustomTimer({
    super.key,
    required this.initialSeconds,
    this.onTick,
    this.onComplete,
    this.showControls = false,
  });

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  late Timer _timer;
  late int _seconds;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _seconds = widget.initialSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
          widget.onTick?.call(_seconds);
        } else {
          _timer.cancel();
          _isRunning = false;
          widget.onComplete?.call();
        }
      });
    });
    _isRunning = true;
  }

  void _pauseTimer() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resumeTimer() {
    _startTimer();
  }

  void _skipTime(int skipSeconds) {
    setState(() {
      if (_seconds > skipSeconds) {
        _seconds -= skipSeconds;
      } else {
        _seconds = 0;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatSeconds(int seconds) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits((seconds % 3600) ~/ 60);
    final remainingSeconds = twoDigits(seconds % 60);
    return '$minutes:$remainingSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEBE9), // Очень светлый бежевый
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _formatSeconds(_seconds),
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              fontFamily: 'Digital',
              color: Colors.brown[900],
            ),
          ),
          if (widget.showControls) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    _isRunning ? Icons.pause : Icons.play_arrow,
                    color: Colors.brown[900],
                  ),
                  onPressed: () {
                    if (_isRunning) {
                      _pauseTimer();
                    } else {
                      _resumeTimer();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.brown[900],
                  ),
                  onPressed: () => _skipTime(300),
                ),
                IconButton(
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.brown[900],
                  ),
                  onPressed: () => _skipTime(900),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
