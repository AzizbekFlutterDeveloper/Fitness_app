import 'package:flutter/material.dart';

class DiskAnimation extends StatefulWidget {
  final ImageProvider<Object>? image;
  final bool isAnimation;
  final double radius;
  const DiskAnimation(
      {Key? key, this.image, this.isAnimation = false, this.radius = 60})
      : super(key: key);

  @override
  _DiskAnimationState createState() => _DiskAnimationState();
}

class _DiskAnimationState extends State<DiskAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(hours: 24),
      vsync: this,
    );
    super.initState();
  }
  
  void isAnimatons(){
    if (widget.isAnimation == true) {
      _controller.forward();
    } else {
      _controller.stop();
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isAnimatons();
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(widget.radius),
        color: Colors.black,
        elevation: 5,
        child: RotationTransition(
          turns: Tween(begin: 1000.0, end: 10000.0).animate(_controller),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                radius: widget.radius,
                backgroundImage: widget.image,
              ),
              Positioned(
                child: CircleAvatar(
                  radius: widget.radius / 4,
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}