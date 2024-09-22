import 'package:flutter/material.dart';

import '../../util/base_utils.dart';
import '../flex/cc_row_between.dart';
import '../inkwell/inkwell_click.dart';
import '../space/cc_space.dart';

@immutable
class IconCopy extends StatelessWidget {
  const IconCopy({Key? key, this.height, this.color}) : super(key: key);

  final double? height;
  final Color? color;

  @override
  Center build(c) => Center(
        child: SizedBox(
          width: height ?? 25,
          child: Icon(
            Icons.copy,
            color: color ?? Colors.grey,
            size: 15,
          ),
        ),
      );
}

@immutable
class CcCopyBtn extends StatelessWidget {
  const CcCopyBtn({super.key, this.onTap, this.title});

  final VoidCallback? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          const IconCopy(),
          InkWellClick(onTap: onTap ?? () => BaseUtils.copyToClipboard(title ?? '')),
        ],
      );
}

@immutable
class CcCopyWidget extends StatelessWidget {
  const CcCopyWidget({super.key, required this.child, this.title});

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) => CcRowBetween(
        children: [
          const CcSpaceSmallest(),

          Expanded(
            flex: 9,
            child: child,
          ),

          /// section : copy widget
          Expanded(
            flex: 1,
            child: CcCopyBtn(
              title: title,
            ),
          ),

          const CcSpaceSmallest(),
        ],
      );
}
