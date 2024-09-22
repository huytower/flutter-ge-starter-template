import 'package:cc_library/widget/button/cc_debounce_widget.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyShowMessage extends StatelessWidget {
  final Widget child;
  final String title;
  final String content;
  final VoidCallback? onTabOK;
  final bool isExistOK;

  const BodyShowMessage(
      {Key? key, required this.child, this.content = '', this.title = '', this.onTabOK, this.isExistOK = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 235,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          children: [
            const CcSpaceLarge(),
            const CcSpaceLarge(),
            title.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(bottom: 20, top: 10),
                    child: Text(title, style: const TextStyle(fontSize: 24)),
                  )
                : const SizedBox(),
            child,
            const CcSpaceLarge(),
            const CcSpaceLarge(),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  !isExistOK
                      ? Expanded(
                          child: CcDebounce(
                            onTap: () => Get.back(),
                            iconColor: Colors.pink,
                            textColor: Colors.white,
                            title: 'Cancel',
                          ),
                        )
                      : const SizedBox(),
                  Expanded(
                      child: CcDebounce(
                    onTap: onTabOK,
                    iconColor: Colors.pink,
                    textColor: Colors.white,
                    title: 'OK',
                  )),
                ],
              ),
            ),
            const CcSpaceSmall(),
          ],
        ),
      );
}
