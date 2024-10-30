import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final bool isLoading;

  const Button({
    super.key,
    required this.onTap,
    required this.label,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.orange,
      ),
      child: ElevatedButton(
        onPressed: !isLoading ? onTap : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: !isLoading
            ? Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              )
            : const SizedBox(
                width: 16.0,
                height: 16.0,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 2,
                ),
              ),
      ),
    );
  }
}
