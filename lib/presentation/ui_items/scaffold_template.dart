import 'package:flutter/material.dart';

class ScaffoldTemplate extends StatelessWidget {
  final Widget child;
  final String name;

  const ScaffoldTemplate({Key? key, required this.child, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6B5642), Color(0xFFD1A881)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: const Color(0xFFD3C0AA),
              centerTitle: true,
              title: Text(name),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD3C0AA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
