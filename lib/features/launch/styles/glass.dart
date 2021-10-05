/// @Hlabs: Pour ajouter le GlassWidget aux widgets
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassWidget extends StatelessWidget {
  final Widget child;
  final double? start;
  final double? end;
  final Color? color;
  const GlassWidget({
    Key? key,
    required this.child,
    this.start,
    this.end,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color != null
                    ? color!.withOpacity(start ?? 0.6)
                    : Colors.white.withOpacity(start ?? 0.6),
                color != null
                    ? color!.withOpacity(start ?? 0.2)
                    : Colors.white.withOpacity(start ?? 0.2),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              width: 1.5,
              color: color != null
                  ? color!.withOpacity(start ?? 0.2)
                  : Colors.white.withOpacity(start ?? 0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
