import 'package:flutter/material.dart';

class CustomSwitcher extends StatefulWidget {
  final bool initialValue;
  final Function(bool value) onToggle;

  const CustomSwitcher({
    Key? key,
    this.initialValue = false,
    required this.onToggle,
  }) : super(key: key);

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher>
    with SingleTickerProviderStateMixin {
  late bool _isChecked;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (_isChecked) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isChecked = !_isChecked;
      if (_isChecked) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      widget.onToggle(_isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: _isChecked
                  ? const Color(0xFF6B5642)
                  : const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: const Color(0xFF6B5642),
                width: 1.5,
              ),
            ),
            child: _isChecked
                ? Center(
                    child: Icon(
                      Icons.check,
                      size: 20,
                      color: const Color(0xFFC9C0B6),
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }
}

// Example usage:
// CustomSwitcher(
//   initialValue: false,
//   onToggle: (value) {
//     print('Switched to: $value');
//   },
// )
