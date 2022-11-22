import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_demo/src/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String titleText;
  final String hintText;
  final TextAlign textAlign;
  final String? initialValue;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldValidator<String>? validation;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final void Function(String value)? onChanged;
  final void Function(String? value)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressed;
  final EdgeInsets margin;
  final TextStyle titleStyle;
  final TextStyle textStyle;
  final EdgeInsets titlePadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enableInteractiveSelection;
  final Color? backgroundColor;
  final int? maxLines;
  final Color? focusedBorder;
  final Color colorBorder;
  final EdgeInsets? contentPadding;
  final bool enable;
  final bool readOnly;
  final double radius;
  final bool isRequired;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.titleText = "",
    this.hintText = "",
    this.initialValue,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.inputFormatters = const [],
    this.validation,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onPressed,
    this.margin = const EdgeInsets.symmetric(vertical: 0),
    this.titleStyle = const TextStyle(fontWeight: FontWeight.normal),
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 14),
    this.titlePadding = const EdgeInsets.only(bottom: 8),
    this.suffixIcon,
    this.prefixIcon,
    this.enableInteractiveSelection = true,
    this.backgroundColor,
    this.maxLines,
    this.focusedBorder,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
    this.colorBorder = Colors.blueAccent,
    this.enable = true,
    this.readOnly = false,
    this.radius = 20,
    this.isRequired = true,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      _onFocusChange();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  _onFocusChange() {
    setState(() {
      isFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: widget.titleText.isEmpty
          ? textFormField
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: widget.titlePadding,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: widget.titleText, style: widget.titleStyle),
                        if (widget.isRequired)
                          const TextSpan(
                              text: ' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ),
                textFormField,
              ],
            ),
    );
  }

  Widget get textFormField => Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: isFocus ? Colors.red : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(widget.radius + 3),
        ),
        child: TextFormField(
          style: widget.textStyle,
          onTap: widget.onPressed,
          textAlign: widget.textAlign,
          focusNode: _focusNode,
          validator: widget.validation,
          controller: widget.controller,
          obscureText: widget.obscureText,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          cursorColor: AppColors.secondary,
          initialValue: widget.initialValue,
          inputFormatters: widget.inputFormatters,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          decoration: decoration,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          maxLines: widget.maxLines ?? 1,
          enabled: widget.enable,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        filled: widget.backgroundColor != null,
        fillColor: widget.backgroundColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.focusedBorder ?? widget.colorBorder,
            width: 1.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.focusedBorder ?? widget.colorBorder,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide:
              BorderSide(color: widget.focusedBorder ?? AppColors.secondary),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        isDense: true,
        enabled: !widget.readOnly,
      );
}
