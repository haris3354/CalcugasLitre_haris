// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableButton extends StatelessWidget {
  SlidableButton(
      {Key? key,
      this.icon,
      this.iconSize,
      this.fontSize,
      this.label,
      this.backgroundColor,
      this.foregroundColor,
      this.borderColor,
      this.flex = 1,
      this.autoClose = true,
      required this.onPressed})
      : super(key: key) {
    borderColor ??= backgroundColor ?? Colors.transparent;
  }

  final IconData? icon;
  final double? iconSize;
  final double? fontSize;
  final String? label;
  final int flex;
  final Color? backgroundColor;
  Color? borderColor;
  final Color? foregroundColor;
  final bool autoClose;
  final SlidableActionCallback? onPressed;
  void _handleTap(BuildContext context) {
    onPressed?.call(context);
    if (autoClose) {
      Slidable.of(context)?.close();
    }
  }
  @override
  Widget build(BuildContext context) {
    final controller = Slidable.of(context);
    return ValueListenableBuilder<double>(
      valueListenable: controller!.animation,
      builder: (context, value, child) {
        final maxRatio = controller.actionPaneConfigurator!.extentRatio;
        final double opacity = value / maxRatio;
        return Flexible(
          flex: flex,
          fit: FlexFit.tight,
          child: Container(
            margin: null,
            child: OutlinedButton(
              onPressed: () => _handleTap(context),
              style: OutlinedButton.styleFrom(
                minimumSize: Size.zero,
                backgroundColor: backgroundColor,
                side: BorderSide(
                  color: borderColor!.withOpacity(opacity),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 28.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(icon,
                      size: iconSize,
                      color: foregroundColor?.withOpacity(opacity)),
                  Text(
                    label ?? '',
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: foregroundColor?.withOpacity(opacity),
                        fontSize: fontSize),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
