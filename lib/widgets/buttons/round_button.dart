import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;

  const RoundButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.transparent,
    this.iconColor = Colors.black,
    this.borderColor = AppColors.gray,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor,
        border: Border.all(
          color: borderColor!,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
