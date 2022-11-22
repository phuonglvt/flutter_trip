import 'package:flutter/material.dart';
import 'package:trip_demo/src/utils/app_colors.dart';

class RippleButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? highlightColor;
  final ShapeBorder? customBorder;
  final bool enable;
  final double? elevation;
  final double? height;
  final EdgeInsets? padding;
  final String? title;
  final Color? colorBorder;
  final Color? colorTitle;

  const RippleButton({
    Key? key,
    this.child = const SizedBox(),
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.customBorder,
    this.highlightColor,
    this.elevation = 4,
    this.enable = true,
    this.height,
    this.padding,
    this.title,
    this.colorBorder,
    this.colorTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor ?? const Color(0xFF4D5DFA),
      elevation: 0,
      minWidth: double.infinity,
      height: height,
      shape: customBorder ??
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            side: BorderSide(
              color: colorBorder ?? AppColors.transparent,
            ),
          ),
      onPressed: enable ? onTap : null,
      padding: padding ?? const EdgeInsets.all(16),
      child: title != null
          ? Text(
              title!,
              style: TextStyle(color: colorTitle ?? AppColors.white),
            )
          : child,
    );
  }
}
