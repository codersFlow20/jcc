import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'dart:developer' as dev;

class ScrollToHideWidget extends StatefulWidget {
  const ScrollToHideWidget({
    super.key,
    required this.controller,
    required this.child,
  });

  final Widget child;
  final ScrollController controller;
  final Duration duration = const Duration(milliseconds: 500);

  @override
  State<ScrollToHideWidget> createState() => ScrollToHideWidgetState();
}

class ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    widget.controller.addListener(listen);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void hide() {
    if (isVisible) {
      dev.log('Hide is called', name: 'Home');
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutSine,
      duration: widget.duration,
      height: isVisible ? 75 : 0,
      child: AnimatedOpacity(
        curve: Curves.easeInOutSine,
        duration: widget.duration,
        opacity: isVisible ? 1 : 0,
        child: widget.child,
      ),
    );
  }
}
