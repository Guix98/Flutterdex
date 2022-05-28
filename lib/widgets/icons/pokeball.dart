import 'package:flutter/material.dart';

class PokeballIcon extends StatelessWidget {
  final double width;
  const PokeballIcon({Key? key, this.width = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, (width * 1).toDouble()),
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.9496403);
    path_0.cubicTo(
        size.width * 0.7483381,
        size.height * 0.9496403,
        size.width * 0.9496403,
        size.height * 0.7483381,
        size.width * 0.9496403,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.9496403,
        size.height * 0.2516640,
        size.width * 0.7483381,
        size.height * 0.05035971,
        size.width * 0.5000000,
        size.height * 0.05035971);
    path_0.cubicTo(
        size.width * 0.2516640,
        size.height * 0.05035971,
        size.width * 0.05035971,
        size.height * 0.2516640,
        size.width * 0.05035971,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.05035971,
        size.height * 0.7483381,
        size.width * 0.2516640,
        size.height * 0.9496403,
        size.width * 0.5000000,
        size.height * 0.9496403);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08992806;
    paint_0_stroke.color = Color(0xffC7C7C7).withOpacity(1.0);
    paint_0_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5000000, size.height * 0.6348921);
    path_1.cubicTo(
        size.width * 0.5744986,
        size.height * 0.6348921,
        size.width * 0.6348921,
        size.height * 0.5744986,
        size.width * 0.6348921,
        size.height * 0.5000000);
    path_1.cubicTo(
        size.width * 0.6348921,
        size.height * 0.4255014,
        size.width * 0.5744986,
        size.height * 0.3651079,
        size.width * 0.5000000,
        size.height * 0.3651079);
    path_1.cubicTo(
        size.width * 0.4255014,
        size.height * 0.3651079,
        size.width * 0.3651079,
        size.height * 0.4255014,
        size.width * 0.3651079,
        size.height * 0.5000000);
    path_1.cubicTo(
        size.width * 0.3651079,
        size.height * 0.5744986,
        size.width * 0.4255014,
        size.height * 0.6348921,
        size.width * 0.5000000,
        size.height * 0.6348921);
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08992806;
    paint_1_stroke.color = Color(0xffC7C7C7).withOpacity(1.0);
    paint_1_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffffffff).withOpacity(0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.05035971, size.height * 0.5000000);
    path_2.lineTo(size.width * 0.3651079, size.height * 0.5000000);
    path_2.moveTo(size.width * 0.6348921, size.height * 0.5000000);
    path_2.lineTo(size.width * 0.9496403, size.height * 0.5000000);
    path_2.lineTo(size.width * 0.6348921, size.height * 0.5000000);
    path_2.close();

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08992806;
    paint_2_stroke.color = Color(0xffC7C7C7).withOpacity(1.0);
    paint_2_stroke.strokeCap = StrokeCap.round;
    paint_2_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_2, paint_2_stroke);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xffffffff).withOpacity(0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
