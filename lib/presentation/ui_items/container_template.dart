import 'package:flutter/material.dart';

class ContainerTemplate extends StatelessWidget {

  final double height;
  final double width;
  final Widget child;
  final Color color;


  const ContainerTemplate({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.black45, // Тень под кнопкой
            offset: Offset(3, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: child
      );
  }
}
