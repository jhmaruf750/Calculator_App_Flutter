import 'package:flutter/material.dart';
import '../constant/colors.dart';

class Button1 extends StatelessWidget {
  final String label;
  final Color textColor;
  final VoidCallback onPressed;

  const Button1({
    super.key,
    required this.label,
    this.textColor = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          radius: 36,
          backgroundColor: AppColors.secondary2Color,
          child: Text(
            label,
            style: TextStyle(
                color: textColor, fontSize: 32, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
