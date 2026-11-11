import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_assets.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_colors.dart';

import '../../../home/presentation/screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation finished
          if (!mounted) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        
      }
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final bool isCompleted = animationController.isCompleted;

        return Scaffold(
          backgroundColor: isCompleted
              ? AppColors.highlightColor
              : AppColors.bgColor,
          body: Center(
            child: SizedBox(
              height: 270,
              width: 270,
              child: isCompleted
                  ? const SizedBox.shrink()
                  : Image.asset(
                      AppAssets.pizzaFrames[(animationController.value * 9)
                          .floor()
                          .clamp(0, 8)],
                    ),
            ),
          ),
        );
      },
    );
  }
}
