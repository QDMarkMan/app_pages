/*
 * @Author: etongfu
 * @Email: 13583254085@163.com
 * @Version: 
 * @Date: 2019-06-14 10:29:40
 * @LastEditors: etongfu
 * @LastEditTime: 2019-06-17 09:39:51
 * @Description: 渐变文字
 * @youWant: add you want info here
 */
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  GradientText(this.data,
      {@required this.gradient,
        this.style,
        this.textAlign = TextAlign.left});

  final String data;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(
        data,
        textAlign: textAlign,
        style: (style == null)
            ? TextStyle(color: Colors.white)
            : style.copyWith(color: Colors.white),
      ),
    );
  }
}