import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {

  final String title;

  TextTitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return   Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.white,
      ),
    );
  }
}
