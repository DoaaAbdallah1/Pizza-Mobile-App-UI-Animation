
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_assets.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_effects.dart';

import '../../../../core/constants/app_colors.dart';

class BoxIcon extends StatelessWidget {
  final String imagePath;
  final double size;
  final VoidCallback onTap;

  const BoxIcon({
    super.key,
    required this.imagePath,
    required this.onTap,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size != 24 ? 17 : 12,
          vertical: size != 24
              ? (imagePath == AppAssets.removeIcon ? 24 : 17)
              : 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          shape: BoxShape.circle,
          boxShadow: [AppEffects.tile],
        ),
        child: SvgPicture.asset(
          imagePath,
          width: size,
        ),
      ),
    );
  }
}
