import 'package:flutter/material.dart';

class ScaffoldApp extends StatelessWidget {
  final Widget child;
  final String name;

  const ScaffoldApp({Key? key, required this.child, required this.name})
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
              iconTheme: const IconThemeData(color: Colors.white70),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                name,
                style: const TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B5642),
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
