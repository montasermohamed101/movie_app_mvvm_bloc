import 'package:flutter/material.dart';

class TextDescWidget extends StatelessWidget {

  final String title;

  TextDescWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return   Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
