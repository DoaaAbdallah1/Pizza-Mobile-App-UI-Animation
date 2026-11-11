
import 'package:flutter/material.dart';

enum AnimationType {
  fromTop,
  fromBottom,
  fromLeft,
  fromRight,
  blink,
}

class CustomAnimation extends StatefulWidget {
  final Widget child;
  final AnimationType animationType;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const CustomAnimation({
    super.key,
    required this.child,
    required this.animationType,
    this.duration = const Duration(milliseconds: 1000),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
  });

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.animationType) {
      case AnimationType.fromTop:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(_animation),
          child: widget.child,
        );

      case AnimationType.fromBottom:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(_animation),
          child: widget.child,
        );

      case AnimationType.fromLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(_animation),
          child: widget.child,
        );

      case AnimationType.fromRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(_animation),
          child: widget.child,
        );

      case AnimationType.blink:
        return FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.96,
              end: 1.0,
            ).animate(_animation),
            child: AnimatedBuilder(
              animation: _animation,
              child: widget.child,
              builder: (context, child) {
                final position = (_animation.value * 2) - 1;

                return ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment(position - 0.5, 0),
                      end: Alignment(position + 0.5, 0),
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.16),
                        Colors.transparent,
                      ],
                    ).createShader(bounds);
                  },
                  child: child,
                );
              },
            ),
          ),
        );
    }
  }
}
