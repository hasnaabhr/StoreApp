import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.title, this.onTap});
  final String title;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFED7646),
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 65,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black26,
            ),
          ),
        ),
      ),
    );
  }
}
