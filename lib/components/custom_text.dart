import 'package:flutter/material.dart';

import 'custom_textstyle.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fw;
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    required this.fw,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: customTextStyle(size, fw),
      textAlign: TextAlign.center,
    );
  }
}
