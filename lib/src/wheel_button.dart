import 'dart:math';
import 'package:flutter/material.dart';

import 'circle_diagonal_line_painter.dart';
import 'each_button.dart';

class  WheelButton extends StatefulWidget {
  final double bottom; // 위젯의 위치를 설정하세요
  final double containerSize; // 위젯의 크기를 설정하세요
  final Color containerBgColor; // 버튼의 색상
  final Color borderColor; // border 색상
  final double borderWidth; // border 두께
  final List<EachButton> buttons; // 최대 8개까지의 버튼을 넣을 수 있습니다
  final bool showLines; // 버튼 사이사이에 라인을 그릴것인가요 아닌가요
  final Widget? centerWidget; // 중앙 아이콘 입니다.

  const WheelButton({
    super.key,
    this.bottom = 0,
    this.containerSize = 300,
    this.containerBgColor = Colors.white,
    this.borderColor = const Color(0xFFE7E6E4),
    this.borderWidth = 1.0,
    required this.buttons,
    this.showLines = false,
    this.centerWidget,
  }) : assert(buttons.length <= 8, '버튼은 최대 8개까지 가능합니다.');


  @override
  WheelButtonState createState() => WheelButtonState();
}

class WheelButtonState extends State< WheelButton> {
  late List<EachButton> _currentButtons; // 현재 화면에 표시될 버튼들

  @override
  void initState() {
    super.initState();
    _currentButtons = widget.buttons; // 초기 버튼 목록 설정
  }

  // 드래그에 따라 버튼들을 한 칸씩 이동하는 함수
  void _shiftButtons(bool left) {
    setState(() {
      if (left) {
        // 왼쪽으로 이동하면 첫 번째 버튼을 리스트 끝으로 보냄
        EachButton first = _currentButtons.removeAt(0);
        _currentButtons.add(first);
      } else {
        // 오른쪽으로 이동하면 마지막 버튼을 리스트 맨 앞으로 보냄
        EachButton last = _currentButtons.removeLast();
        _currentButtons.insert(0, last);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: widget.bottom,
              child: GestureDetector(
                onPanUpdate: (details) {
                  // 수평 드래그 감지
                  if (details.delta.dx < 0) {
                    // 왼쪽으로 드래그할 때
                    _shiftButtons(true);
                  } else if (details.delta.dx > 0) {
                    // 오른쪽으로 드래그할 때
                    _shiftButtons(false);
                  }
                },
                child: Container(
                  width: widget.containerSize,
                  height: widget.containerSize,
                  decoration: BoxDecoration(
                    color: widget.containerBgColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: widget.borderColor, width: widget.borderWidth),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if( widget.showLines )
                        CustomPaint(
                          size: Size(widget.containerSize,widget.containerSize ),
                          painter : CircleDiagonalLinePainter(numberOfButtons : widget.buttons.length),
                        ),

                      Stack(
                        alignment: Alignment.center,
                        children: _buildPositionedButtons(),
                      ),

                      // 중앙 아이콘
                      widget.centerWidget ??
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Color(0xFF373430),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE6E2DB),
                                  shape: BoxShape.circle,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  List<Widget> _buildPositionedButtons() {
    List<Widget> positionedButtons = [];
    double roundStep = 360 / _currentButtons.length;

    for (int i = 0; i < _currentButtons.length; i++) {
      double angle = roundStep * i;
      double rad = angle * (pi / 180);
      double xPos = (widget.containerSize / 2) * 0.7 * -cos(rad);
      double yPos = (widget.containerSize / 2) * 0.7 * -sin(rad);

      positionedButtons.add(Positioned(
        left: widget.containerSize / 2 + xPos - 28,
        top: widget.containerSize / 2 + yPos - 28,
        child: _currentButtons[i],
      ));
    }
    return positionedButtons;
  }
}
