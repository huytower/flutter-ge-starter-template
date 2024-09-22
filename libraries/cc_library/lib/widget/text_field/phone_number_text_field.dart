import 'package:cc_library/constant/cc_number_format_params.dart';
import 'package:cc_library/helper/widget_helper.dart';
import 'package:cc_library/widget/divider_line/cc_divider.dart';
import 'package:cc_library/widget/flex/cc_column_start.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField(
    this.hintText, {
    Key? key,
    required this.onChanged,
    required this.onSubmit,
    this.action,
    required this.controller,
    this.formatter,
    this.hintStyle,
    this.keyboardType,
    this.maxLength,
    this.suffix,
    this.textStyle,
  }) : super(key: key);

  final Function onChanged, onSubmit;

  final int? maxLength;
  final String? formatter, hintText;

  final TextInputAction? action;
  final TextEditingController controller;
  final TextStyle? hintStyle, textStyle;
  final TextInputType? keyboardType;

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
            autofillHints: [AutofillHints.username],
            controller: controller,
            onChanged: (v) => onChanged(v),
            onFieldSubmitted: (v) => onSubmit(v),
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: hintStyle ??
                  WidgetHelper.getTextStyleRoboto(fontSize: 17, fontStyle: FontStyle.italic, heightLine: 1.2),
            ),

            /// Logic : max length = 12, included space
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength ?? 12),
              MaskTextInputFormatter(
                  mask: formatter ?? CcNumberFormatParams.PHONE_NUMBER_VN, filter: {'#': RegExp(r'[0-9]')}),
            ],
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            style: textStyle ?? WidgetHelper.getTextStyleRoboto(fontSize: 18, heightLine: 1.2),
            textInputAction: action ?? TextInputAction.next,
          ),

          /// Section : Icon
          Positioned(bottom: 0, right: 0, top: 0, child: suffix ?? const SizedBox()),
        ],
      );
}
