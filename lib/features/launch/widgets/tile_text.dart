import 'package:flutter/material.dart';
import 'package:proschool/core/utils/colors.dart';

class WhiteTileText extends StatelessWidget {
  final bool bold;
  final double? fontSize;
  final double? maxHeight;
  final double? maxWidth;
  final String text;

  const WhiteTileText({
    Key? key,
    required this.bold,
    this.fontSize,
    required this.text,
    this.maxHeight,
    this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? (MediaQuery.of(context).size.width / 4),
        maxWidth: maxWidth ?? (MediaQuery.of(context).size.width / 2.5),
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(
          color: mainBackground,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize ?? 14,
        ),
      ),
    );
  }
}
