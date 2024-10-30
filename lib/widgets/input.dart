import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;

  const Input({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return 'Campo obrigatório';
        }

        return null;
      },
    );
  }
}
