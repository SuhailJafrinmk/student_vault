import 'package:flutter/material.dart';

class PendulumAnimation extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final Duration duration;
  final double swingRange;

  PendulumAnimation({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.duration,
    required this.swingRange,
  }) : super(key: key);

  @override
  _PendulumAnimationState createState() => _PendulumAnimationState();
}

class _PendulumAnimationState extends State<PendulumAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Define the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Define the animation tween
    _animation = Tween<double>(begin: -widget.swingRange, end: widget.swingRange).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Repeat the animation infinitely
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0), // Adjust the range and direction of the swing
          child: Material(
            elevation: 20,
            child: Container(
              width: widget.width,
              height: widget.height,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}
