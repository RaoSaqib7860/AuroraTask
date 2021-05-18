import 'package:flutter/material.dart';

class MorphismView {
  static outerMorphism() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.7),
        blurRadius: 1,
        offset: Offset(
          -2.0,
          -2.0,
        ),
      ),
      BoxShadow(
        color: Colors.black12,
        offset: Offset(
          5,
          5,
        ),
      ),
    ], color: Colors.white, borderRadius: BorderRadius.circular(5));
  }

  static innerMorphism() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.11),
        blurRadius: 0,
        offset: Offset(
          -5,
          -5,
        ),
      ),
      BoxShadow(
        color: Colors.white.withOpacity(0.7),
        blurRadius: 1,
        spreadRadius: 2,
        offset: Offset(
          5.0,
          5.0,
        ),
      ),
    ], color: Colors.black, borderRadius: BorderRadius.circular(5));
  }
}
