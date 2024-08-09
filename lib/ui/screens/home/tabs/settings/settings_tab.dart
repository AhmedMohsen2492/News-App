import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: const Text(
          "Settings",
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
