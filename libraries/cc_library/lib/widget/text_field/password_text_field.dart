import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/widget/divider_line/cc_divider.dart';
import 'package:cc_library/widget/flex/cc_column_start.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
    this.hintText, {
    Key? key,
    required this.onChanged,
    required this.onSubmit,
    this.action,
    required this.controller,
    this.hintStyle,
    this.maxLength,
    this.obscureText,
    this.suffix,
    this.textStyle,
  }) : super(key: key);

  final bool? obscureText;

  final Function onChanged, onSubmit;

  final int? maxLength;

  final String? hintText;

  final TextEditingController controller;

  final TextInputAction? action;

  final TextStyle? hintStyle, textStyle;

  final Widget? suffix;

  @override
  Widget build(c) => Material(
        color: Colors.transparent,
        child: CcColStart(children: [
          /// Section : Edit text
          getEditTextWidget(),

          const CcSpaceSmall(),

          /// Section : Line
          const CcDividerLine(),
        ]),
      );

  Widget getEditTextWidget() => Stack(
        children: [
          /// Section : Edit text
          TextFormField(
            autofillHints: [AutofillHints.password],
            onChanged: (v) => onChanged(v),
            onFieldSubmitted: (v) => onSubmit(v),
            controller: controller,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: hintStyle ??
                  WidgetHelper.getTextStyleRoboto(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    heightLine: 1.2,
                  ),
            ),

            /// Logic : max length = 20
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength ?? 20),
            ],
            obscureText: obscureText ?? true,
            keyboardType: TextInputType.text,
            style: textStyle ??
                WidgetHelper.getTextStyleRoboto(
                  fontSize: 18,
                  heightLine: 1.2,
                ),
            textInputAction: action ?? TextInputAction.next,
          ),

          /// Section : Icon
          Positioned(bottom: 0, right: 0, top: 0, child: suffix ?? const SizedBox()),
        ],
      );
}
