import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppBarSection extends StatefulWidget {
  const AppBarSection({super.key});

  @override
  State<AppBarSection> createState() => _AppBarSectionState();
}

class _AppBarSectionState extends State<AppBarSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;
  bool _isIconHovered = false;
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return MouseRegion(
                  onEnter: (_) => setState(() => _isIconHovered = true),
                  onExit: (_) => setState(() => _isIconHovered = false),
                  child: GestureDetector(
                      onScaleStart: (details) {
                        _previousScale = _scale;
                        setState(() {});
                      },
                      onScaleUpdate: (details) {
                        _scale = _previousScale * details.scale;
                        setState(() {});
                      },
                      onScaleEnd: (details) {
                        _previousScale = 1.0;
                        setState(() {});
                      },
                      child: Transform.scale(
                          key: const Key("ER"),
                          scale: _scale,
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              // width: _isHovered ? 220 : 200,
                              // height: _isHovered ? 220 : 200,
                              // color: _isHovered ? Colors.blue : Colors.red,
                              child: Transform(
                                transform:
                                    Matrix4.rotationY(_controller.value * pi),
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _isIconHovered
                                          ? Colors.transparent
                                          : Colors.white,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: child,
                                ),
                              )))));
            },
            child: Text(
              "PM",
              style: TextStyle(
                  color: const Color(0xffFFC371), // Text color
                  fontSize: 24,
                  fontWeight:
                      _isIconHovered ? FontWeight.bold : FontWeight.normal),
            ),
          ),
          const Spacer(),
          MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: GestureDetector(
              onScaleStart: (details) {
                _previousScale = _scale;
                setState(() {});
              },
              onScaleUpdate: (details) {
                _scale = _previousScale * details.scale;
                setState(() {});
              },
              onScaleEnd: (details) {
                _previousScale = 1.0;
                setState(() {});
              },
              child: Transform.scale(
                scale: _scale,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  // width: _isHovered ? 220 : 200,
                  // height: _isHovered ? 220 : 200,
                  // color: _isHovered ? Colors.blue : Colors.red,
                  child: Lottie.asset(
                    "assets/animations/flutter_anim.json",
                    width: _isHovered ? 150 : 105,
                    height: _isHovered ? 55 : 45,

                    //controller: _controller,
                    onLoaded: (composition) {
                      _controller.duration = composition.duration;
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
