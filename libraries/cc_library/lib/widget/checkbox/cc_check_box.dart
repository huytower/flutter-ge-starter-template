import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/padding/cc_padding.dart';
import 'package:flutter/material.dart';

class CcCheckBox extends StatelessWidget {
  const CcCheckBox({Key? key, required this.onPress, required this.isChecked}) : super(key: key);

  final VoidCallback onPress;

  final bool isChecked;

  @override
  CcPadding build(c) => CcPadding(
      Material(
        color: Colors.transparent,
        child: Container(
          color: Colors.transparent,
          width: 25,
          child: IconButton(
            onPressed: onPress,
            icon: Icon(
              isChecked ? Icons.check : Icons.radio_button_unchecked,
              size: 20,
              color: isChecked ? BaseColors.blue : Colors.black,
            ),
            color: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ),
      0,
      CcPaddingParams.PAGE_MID,
      0,
      0);
}
