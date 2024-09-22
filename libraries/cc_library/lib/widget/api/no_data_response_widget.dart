import 'package:cc_library/theme/base_colors.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/cupertino.dart';

class NoDataResponseWidget extends StatelessWidget {
  const NoDataResponseWidget({Key? key, this.title = 'Không có dữ liệu'}) : super(key: key);

  final String title;

  @override
  SizedBox build(c) => SizedBox(
        height: 50,
        child: CcText(
          title,
          align: Alignment.center,
          color: BaseColors.black_80,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
          textAlign: TextAlign.center,
        ),
      );
}
