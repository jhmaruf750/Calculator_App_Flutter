import 'package:flutter/material.dart';
import '../constant/colors.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CalculateButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 160,
        width: 70,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Center(
          child: Text(
            "=",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
