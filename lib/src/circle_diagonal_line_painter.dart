import 'dart:math';
import 'package:flutter/cupertino.dart';

class CircleDiagonalLinePainter extends CustomPainter {
  final int numberOfButtons; // 버튼의 개수
  final Color lineColor; // 선의 색상
  final double strokeWidth; // 선의 굵기
  final double lineEnd; // 중앙부터 선의 직선 거리

  CircleDiagonalLinePainter({
    required this.numberOfButtons,
    this.lineColor = const Color(0xFFffffff),
    this.strokeWidth = 2,
    this.lineEnd = 2
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()

      ..color = lineColor
      ..strokeWidth = strokeWidth;

    // 원의 중심
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / lineEnd;

    // 각도 계산 (360도를 버튼 개수만큼 나누기)
    double angleStep = 360 / numberOfButtons;

    for (int i = 0; i < numberOfButtons; i++) {
      // 각도를 라디안으로 변환
      double angle = (angleStep * i + angleStep / 2) * pi / 180;

      // 시작점과 끝점 계산 (원의 중심에서 각도에 따라 끝점 계산)
      Offset startPoint = Offset(center.dx, center.dy);
      Offset endPoint = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      // 선 그리기
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
