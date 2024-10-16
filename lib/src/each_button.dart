import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EachButton extends StatelessWidget {
  final double? buttonSizeWidth; //버튼크기 추천:56
  final double? buttonSizeHeight; //버튼크기  추천 : 56
  final String? imagePath; //이미지가 있으면 이미지 경로
  final IconData? icon; // 이미지가 없으면 아이콘
  final Color? imageOrIconColor; //이미지나 아이콘 색상
  final String? label; //밑에 뭐라고 나오게 할 건지
  final double imageSize; // 이미지 혹은 아이콘 사이즈
  final TextStyle? labelStyle; //label (text) 스타일
  final VoidCallback? onTap; // 클릭했을때 어떻게 나오게 할 것인지

  const EachButton({
    this.buttonSizeWidth = 56,
    this.buttonSizeHeight = 56,
    this.imagePath,
    this.icon,
    this.imageOrIconColor = Colors.black,
    this.label,
    this.imageSize = 24,
    this.labelStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonSizeHeight,
      width: buttonSizeWidth,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null) //이미지 경로가 있으면
              Image.asset(
                imagePath!,
                width: imageSize,
                height: imageSize,
              )
            else if (icon != null) //아이콘 경로가 있으면
              Icon(
                icon,
                size: imageSize,
                color: imageOrIconColor,
              )
            else //그것도 아니라면
              SizedBox(
                width: imageSize,
                height: imageSize,
              ),
            SizedBox(height: 4),
            if (label != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  label!,
                  style: labelStyle ??
                      TextStyle(fontSize: 10, color: Color(0xFF373430)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
