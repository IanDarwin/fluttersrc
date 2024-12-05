import 'package:flutter/material.dart';

/// A simple graphics demo. Very good tutorial at
/// https://www.kodeco.com/26483389-flutter-canvas-api-getting-started
void main() {
  runApp(const SimpleDrawWidget());
}

class SimpleDrawWidget extends StatelessWidget {
  const SimpleDrawWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Gfx Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomPaint(
        painter: FancyPaints(),
      ),
    );
  }
}

class FancyPaints extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var midX = size.width / 2;
    var midY = size.height / 2;
    const drawColor = Colors.orangeAccent;
    final paint = Paint()
      ..strokeWidth = 7
      ..color = drawColor
      ..style = PaintingStyle.fill;

    final triangle = Path();
    triangle.moveTo(midX, 200);
    triangle.relativeLineTo(100, -100);
    triangle.relativeLineTo(-200, 0);
    triangle.close();
    canvas.drawPath(triangle, paint);

    paint.style = PaintingStyle.stroke;
    var opacity = 1.0;
    var concentricCircleRadius = 100.0;
    var center = Offset(midX, 300);
    while (concentricCircleRadius > 0) {
      paint.color = paint.color.withOpacity(opacity -= 0.1);
      canvas.drawCircle(center, concentricCircleRadius, paint);
      concentricCircleRadius -= 10;
    }

    paint.style = PaintingStyle.fill;
    paint.color = drawColor;

    final triangle2 = Path();
    triangle2.moveTo(midX, 400);
    triangle2.relativeLineTo(100, 100);
    triangle2.relativeLineTo(-200, 0);
    triangle2.close();
    canvas.drawPath(triangle2, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
