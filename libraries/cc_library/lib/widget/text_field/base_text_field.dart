import 'package:cc_library/constant/cc_number_format_params.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/divider_line/cc_divider.dart';
import 'package:cc_library/widget/flex/cc_column_start.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
    this.hintText, {
    Key? key,
    required this.onChanged,
    required this.onSubmit,
    this.textInputAction = TextInputAction.next,
    required this.controller,
    this.filter,
    this.formatter,
    this.hintStyle,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.suffix,
    this.textStyle,
  }) : super(key: key);

  final Function onChanged, onSubmit;

  final int? maxLength;

  final Map<String, RegExp>? filter;

  final String? formatter, hintText;

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextStyle? hintStyle, textStyle;

  final Widget? suffix;

  @override
  Widget build(c) => Material(
        color: Colors.transparent,
        child: CcColStart(children: [
          /// Section : Edit text
          getEditTextWidget(),

          SizedBox(
            height: 8,
          ),

          /// Section : Line
          CcDividerLine(
            color: BaseColors.gray_40,
            height: 1,
          ),
        ]),
      );

  Widget getEditTextWidget() => Stack(
        children: [
          /// Section : Edit text
          TextFormField(
            onChanged: (v) => onChanged(v),
            onFieldSubmitted: (v) => onSubmit(v),
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: hintStyle ??
                  TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    height: 1.2,
                  ),
            ),
            controller: controller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength ?? 12),

              /// Logic : validate input text,
              /// ex. : https://stackoverflow.com/questions/52835450/flutter-how-to-avoid-special-characters-in-validator
              MaskTextInputFormatter(
                  mask: formatter ?? CcNumberFormatParams.NUMBER,
                  filter: filter ?? {'#': RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$')}),
            ],
            keyboardType: keyboardType,
            style: textStyle ?? TextStyle(fontSize: 18, color: BaseColors.white_80, height: 1.2),
            textInputAction: textInputAction,
          ),

          /// Section : Icon
          Positioned(bottom: 0, right: 0, top: 0, child: suffix ?? const SizedBox()),
        ],
      );
}
