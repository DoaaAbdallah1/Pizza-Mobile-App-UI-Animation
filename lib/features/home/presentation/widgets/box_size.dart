
import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_effects.dart';

import '../../../../core/constants/app_colors.dart';

class BoxSizeWidget extends StatelessWidget {
  final String text;
  final bool isSelect;
  final VoidCallback onTap;

  const BoxSizeWidget({
    super.key,
    required this.text,
    required this.isSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: !isSelect
              ? AppColors.bgColor
              : AppColors.activeColor,
          shape: BoxShape.circle,
          border: isSelect
              ? Border.all(
                  color: Colors.white,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                )
              : null,
          boxShadow: [AppEffects.tile],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            height: 24 / 18,
            letterSpacing: -0.02,
            color: isSelect
                ? AppColors.bgColor
                : AppColors.activeColor,
          ),
        ),
      ),
    );
  }
}
