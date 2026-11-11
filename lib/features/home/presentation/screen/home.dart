import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_assets.dart';
import 'package:pizza_mobile_app_ui/features/home/presentation/widgets/box_icon.dart';
import 'package:pizza_mobile_app_ui/features/home/presentation/widgets/pizza_carousel.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_animation.dart';
import '../../data/models/pizza_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/box_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedSize = 'M';

  final List<Pizza> pizzas = PizzaData.pizzas;

  late Pizza selectedPizza;

  @override
  void initState() {
    super.initState();
    selectedPizza = pizzas[1];
  }

  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  double get totalPrice {
    return selectedPizza.getPrice(selectedSize) * quantity;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -83,
            right: -screenWidth * 0.3,
            child: Container(
              width: screenWidth * 1.6,
              height: screenWidth * 1.6,
              decoration: BoxDecoration(
                color: AppColors.highlightColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: screenWidth * 1.6 - 83 - 40 - 34,
            left: 0,
            right: 0,
            child: CustomAnimation(
              delay: const Duration(milliseconds: 900),

              animationType: AnimationType.fromBottom,
              child: Image.asset(AppAssets.bananaImage, width: 97, height: 63),
            ),
          ),
          Positioned(
            top: screenWidth * 1.6 - 83 - 40,
            left: 0,
            right: 0,
            child: CustomAnimation(
              animationType: AnimationType.fromBottom,
              delay: const Duration(milliseconds: 900),

              child: Container(
                height: 64,
                width: 244,
                //  color: AppColors.accentColor,
                margin: EdgeInsets.only(bottom: 24, right: 65, left: 65),

                child: Row(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    BoxSizeWidget(
                      text: 'S',
                      isSelect: selectedSize == 'S',
                      onTap: () {
                        setState(() {
                          selectedSize = 'S';
                          quantity = 1;
                        });
                      },
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: BoxSizeWidget(
                        text: 'M',
                        isSelect: selectedSize == 'M',
                        onTap: () {
                          setState(() {
                            selectedSize = 'M';
                            quantity = 1;
                          });
                        },
                      ),
                    ),

                    BoxSizeWidget(
                      text: 'L',
                      isSelect: selectedSize == 'L',
                      onTap: () {
                        setState(() {
                          selectedSize = 'L';
                          quantity = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: CustomAnimation(
              animationType: AnimationType.blink,
              delay: const Duration(milliseconds: 300),
              child: PizzaCarousel(
                selectedSize: selectedSize,
                pizzas: pizzas,
                onPizzaChanged: (pizza) {
                  setState(() {
                    selectedPizza = pizza;
                    quantity = 1;
                  });
                },
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                AppBarWidget(namePizza: selectedPizza.name),
                Spacer(),

                CustomAnimation(
                  animationType: AnimationType.fromBottom,
                  delay: const Duration(milliseconds: 600),

                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    child: Text(
                      selectedPizza.description,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.activeColor,
                        letterSpacing: 0,
                        height: 24 / 14,
                      ),
                    ),
                  ),
                ),
                CustomAnimation(
                  animationType: AnimationType.blink,
                  delay: const Duration(milliseconds: 900),

                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Quantity Selector
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.highlightColor,
                            borderRadius: BorderRadius.circular(48),
                          ),
                          child: Row(
                            children: [
                              BoxIcon(
                                imagePath: AppAssets.removeIcon,
                                size: 14,
                                onTap: decreaseQuantity,
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(
                                  '$quantity',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    height: 24 / 24,
                                    color: AppColors.activeColor,
                                  ),
                                ),
                              ),

                              BoxIcon(
                                imagePath: AppAssets.addIcon,
                                size: 14,
                                onTap: increaseQuantity,
                              ),
                            ],
                          ),
                        ),

                        // Total Price
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '\$${totalPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                height: 24 / 24,
                                color: AppColors.activeColor,
                              ),
                            ),
                          ),
                        ),

                        // Add Button
                        TextButton(
                          style: ButtonStyle(
                            padding: WidgetStatePropertyAll(
                              const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.accentColor,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              height: 24 / 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
