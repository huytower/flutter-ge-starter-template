import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:flutter/cupertino.dart';

class CcSpace extends StatelessWidget {
  const CcSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: CcPaddingParams.SPACE_MID,
        width: CcPaddingParams.SPACE_MID,
      );
}

class CcSpaceFooter extends StatelessWidget {
  const CcSpaceFooter({Key? key}) : super(key: key);

  @override
  Widget build(c) => const SizedBox(
        height: CcPaddingParams.SPACE_LARGEST * 3,
      );
}

class CcSpaceFooterAppName extends StatelessWidget {
  const CcSpaceFooterAppName({Key? key}) : super(key: key);

  @override
  Widget build(c) => const SizedBox(height: CcPaddingParams.SPACE_LARGEST);
}

class CcSpaceHeader extends StatelessWidget {
  const CcSpaceHeader({Key? key}) : super(key: key);

  @override
  Widget build(c) => const SizedBox(height: CcPaddingParams.SPACE_LARGEST * 2);
}

class CcSpaceLarge extends StatelessWidget {
  const CcSpaceLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: CcPaddingParams.SPACE_LARGE,
        width: CcPaddingParams.SPACE_LARGE,
      );
}

class CcSpaceSmall extends StatelessWidget {
  const CcSpaceSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: CcPaddingParams.SPACE_SMALL,
        width: CcPaddingParams.SPACE_SMALL,
      );
}

class CcSpaceSmallest extends StatelessWidget {
  const CcSpaceSmallest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: CcPaddingParams.SPACE_SMALLEST,
        width: CcPaddingParams.SPACE_SMALLEST,
      );
}
