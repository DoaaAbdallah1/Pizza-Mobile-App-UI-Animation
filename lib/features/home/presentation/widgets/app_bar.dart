import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_assets.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_colors.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_text_styles.dart';

import '../../../../core/widgets/custom_animation.dart';
import 'box_icon.dart';

class AppBarWidget extends StatelessWidget {
  final String namePizza;
  const AppBarWidget({super.key, required this.namePizza});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAnimation(
            delay: const Duration(milliseconds: 300),
            animationType: AnimationType.fromLeft,
            child: BoxIcon(
              imagePath: AppAssets.barIconBack,
              onTap: () {
                print("back");
              },
            ),
          ),
          CustomAnimation(
            delay: const Duration(milliseconds: 300),

            animationType: AnimationType.fromTop,
            child: Column(
              children: [
                Text(
                  "Pizzas",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 20 / 10,
                    color: AppColors.textColor,
                  ),
                ),
                Text(namePizza, style: AppTextStyles.h2),
              ],
            ),
          ),
          CustomAnimation(
            delay: const Duration(milliseconds: 300),

            animationType: AnimationType.fromRight,
            child: BoxIcon(imagePath: AppAssets.iconFav, onTap: () {}),
          ),
        ],
      ),
    );
  }
}
