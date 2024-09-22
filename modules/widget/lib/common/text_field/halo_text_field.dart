import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/src/prj_color.dart';
import 'package:widget/export/cc_ui_export.dart';

class CcTextField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final Function()? onClean;
  final String? errorText;
  final String? hintText;
  final String? labelText;
  final String? Function(String? value)? validator;
  final Icon? suffixIcon;
  final bool readOnly;
  final Function()? onTabSuffix;
  final Function(String value)? onChange;
  final bool enableOutline;
  final Color backgroundColor;
  final double radiusBorder;
  final EdgeInsets? padding;
  final String? initialValue;
  final String? allowFormat;
  final String? denyFormat;
  final TextInputType keyboardType;
  final Function()? onTap;
  final TextInputAction? textInputAction;

  const CcTextField({
    Key? key,
    this.controller,
    this.margin,
    this.onClean,
    this.validator,
    this.errorText,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.onTabSuffix,
    this.onChange,
    this.enableOutline = false,
    this.backgroundColor = Colors.transparent,
    this.radiusBorder = 6,
    this.padding,
    this.initialValue,
    this.allowFormat,
    this.denyFormat,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    this.textInputAction,
  }) : super(key: key);

  @override
  _TextFieldBaseState createState() => _TextFieldBaseState();
}

class _TextFieldBaseState extends State<CcTextField> {
  late ThemeData theme;
  late TextTheme textTheme;
  var regexExist = false;

  @override
  void initState() {
    super.initState();
    regexExist = widget.allowFormat != null || widget.denyFormat != null;
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    textTheme = theme.textTheme;
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.radiusBorder)),
        color: widget.backgroundColor,
      ),
      child: TextFormField(
        onTap: widget.onTap?.call(),
        textInputAction: widget.textInputAction,
        onFieldSubmitted: (_) => widget.textInputAction == TextInputAction.next
            ? FocusScope.of(context).nextFocus()
            : FocusScope.of(context).unfocus(),
        readOnly: widget.readOnly,
        onChanged: (value) => widget.onChange?.call(value),
        keyboardType: widget.keyboardType,
        inputFormatters: (regexExist == true)
            ? <TextInputFormatter>[
                if (widget.allowFormat?.isNotEmpty == true) ...[
                  FilteringTextInputFormatter.allow(
                    RegExp(
                      widget.allowFormat ?? "",
                    ),
                  ),
                ] else if (widget.allowFormat?.isNotEmpty == true) ...[
                  FilteringTextInputFormatter.deny(
                    RegExp(
                      widget.denyFormat ?? "",
                    ),
                  ),
                ]
              ]
            : null,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: SizedBox(
            child: InkWell(
              child: widget.suffixIcon,
              onTap: () => widget.onTabSuffix?.call(),
            ),
            height: 20,
            width: 20,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          focusedBorder: getInputBorder(widget.enableOutline, theme.primaryColor),
          enabledBorder: getInputBorder(widget.enableOutline, PrjColors.secondary),
          errorBorder: getInputBorder(widget.enableOutline, PrjColorsSimple.notice),
          focusedErrorBorder: getInputBorder(widget.enableOutline, PrjColorsSimple.notice),
          errorStyle: theme.textTheme.headlineSmall,
          hintStyle: theme.textTheme.headlineSmall,
        ),
        cursorColor: theme.primaryColor,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }

  InputBorder getInputBorder(bool enableOutline, Color _color) {
    return (widget.backgroundColor == Colors.transparent)
        ? (enableOutline ? outlineInputBorder(_color) : underlineInputBorder(_color))
        : InputBorder.none;
  }

  UnderlineInputBorder underlineInputBorder(Color _color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: _color),
      borderRadius: const BorderRadius.all(
        Radius.circular(0),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color _color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: _color, width: 1.0),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}
