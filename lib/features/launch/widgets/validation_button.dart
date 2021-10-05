import 'package:flutter/material.dart';
import 'package:proschool/core/utils/colors.dart';

class ValidationButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final void Function()? onPressed;
  final String text;
  final double? width;

  const ValidationButton({
    Key? key,
    this.color,
    this.onPressed,
    required this.text,
    this.width,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: color ?? mainColor,
        padding: const EdgeInsets.all(10.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
              fontSize: 15,
              color: color == null ? mainBackground : mainColor,
            )),
      ),
    );
  }
}
//
// ValidationButton(
//
//
// );
