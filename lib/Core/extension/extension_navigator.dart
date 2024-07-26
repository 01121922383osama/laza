import 'package:flutter/material.dart';

extension GotoPage on BuildContext {
  void push({required Widget page}) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}
