import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pizza_mobile_app_ui/core/constants/app_assets.dart';

import '../../data/models/pizza_model.dart';

class PizzaCarousel extends StatefulWidget {
  final String selectedSize;
  final List<Pizza> pizzas;
  final ValueChanged<Pizza> onPizzaChanged;

  const PizzaCarousel({
    super.key,
    required this.selectedSize,
    required this.pizzas,
    required this.onPizzaChanged,
  });

  @override
  State<PizzaCarousel> createState() => _PizzaCarouselState();
}

class _PizzaCarouselState extends State<PizzaCarousel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  int currentIndex = 1;

  final Map<String, double> pizzaSizes = {'S': 160, 'M': 200, 'L': 260};

  void _changePizza(int index) {
    _carouselController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      width: double.infinity,
      child: CarouselSlider.builder(
        carouselController: _carouselController,
        itemCount: widget.pizzas.length,
        itemBuilder: (context, index, realIndex) {
          final isCurrentPizza = index == currentIndex;

          final imageSize = isCurrentPizza
              ? (pizzaSizes[widget.selectedSize] ?? 196)
              : 100.0;

          return GestureDetector(
            onTap: () => _changePizza(index),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: imageSize,
                height: imageSize,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Hero(
                      tag: 'pizza_zoom_${widget.pizzas[index].image}',
                      child: Material(
                        color: Colors.transparent,
                        child: Image.asset(
                          widget.pizzas[index].image,
                          fit: BoxFit.contain,
                          width: imageSize,
                          height: imageSize,
                        ),
                      ),
                    ),

                    if (isCurrentPizza)
                      IconButton(
                        onPressed: () {
                          _zoomPizza(context, widget.pizzas[index].image);
                        },
                        highlightColor: Colors.transparent,
                        icon: Image.asset(AppAssets.zoomIcon, width: pizzaSizes[widget.selectedSize],height: pizzaSizes[widget.selectedSize],),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 380,
          viewportFraction: 0.52,
          initialPage: currentIndex,
          enlargeCenterPage: false,
          enableInfiniteScroll: false,
          autoPlay: false,
          clipBehavior: Clip.none,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });

            widget.onPizzaChanged(widget.pizzas[index]);
          },
        ),
      ),
    );
  }

  void _zoomPizza(BuildContext context, String imagePath) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black.withOpacity(0.95),

        // Time taken by the zoom animation
        transitionDuration: const Duration(milliseconds: 900),
        reverseTransitionDuration: const Duration(milliseconds: 700),

        pageBuilder: (context, animation, secondaryAnimation) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SizedBox.expand(
                child: Hero(
                  tag: 'pizza_zoom_$imagePath',
                  child: Material(
                    color: Colors.transparent,
                    child: SizedBox.expand(
                      child: Transform.scale(
                        scale: 1.3,
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}
