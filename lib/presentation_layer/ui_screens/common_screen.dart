import 'package:flutter/material.dart';

class CommonScreen extends StatelessWidget {
  final String screen;
  const CommonScreen(this.screen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(screen)));
  }
}
