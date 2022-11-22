import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class BasePage extends StatelessWidget {
  //   /// When screen has [TextField] or [TextFormField]
  //   /// Default is false
  //   ///
  //   /// If this is true, then touching outside [TextField] or [TextFormField]
  //   /// will unFocus and hide the keyboard
  final bool unFocusWhenTouchOutsideInput;

  //   /// The widget below this widget in the tree.
  //   ///
  //   /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  const BasePage({
    Key? key,
    required this.child,
    this.unFocusWhenTouchOutsideInput = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return unFocusWhenTouchOutsideInput
        ? GestureDetector(
            onTap: () => Get.focusScope?.unfocus(),
            child: child,
          )
        : child;
  }
}
