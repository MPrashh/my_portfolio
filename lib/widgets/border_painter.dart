import 'dart:ui';

import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  final double progress;
  BorderPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final RRect outerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(15),
    );

    final Paint borderPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawRRect(outerRect, borderPaint);

    // Define gradient colors
    final List<Color> gradientColors = [
       Colors.white60,
      const Color(0xff19547b),
      // Colors.white60,
      // Colors.grey,
      // Colors.white60,
    ]; // Example gradient colors

    final Paint animatedPaint = Paint()
      ..shader = _buildGradientShader(outerRect, gradientColors)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Path path = Path()..addRRect(outerRect);

    final PathMetric pathMetric = path.computeMetrics().first;
    final Path extractPath = pathMetric.extractPath(
      0,
      pathMetric.length * progress,
    );

    canvas.drawPath(extractPath, animatedPaint);
  }

  Shader _buildGradientShader(RRect outerRect, List<Color> gradientColors) {
    final Path gradientPath = Path()..addRRect(outerRect);
    final Rect bounds = gradientPath.getBounds();
    return LinearGradient(
      colors: gradientColors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(bounds);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// import 'dart:ui';

// import 'package:flutter/material.dart';

// class BorderPainter extends CustomPainter {
//   final double progress;
//   BorderPainter(this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final RRect outerRect = RRect.fromRectAndRadius(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       const Radius.circular(15),
//     );

//     final Paint borderPaint = Paint()
//       ..color = Colors.grey
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4;

//     canvas.drawRRect(outerRect, borderPaint);

//     final Paint animatedPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4;

//     final Path path = Path()..addRRect(outerRect);

//     final PathMetric pathMetric = path.computeMetrics().first;
//     final Path extractPath = pathMetric.extractPath(
//       0,
//       pathMetric.length * progress,
//     );

//     canvas.drawPath(extractPath, animatedPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
