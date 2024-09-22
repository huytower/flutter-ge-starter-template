import 'package:auto_route/annotations.dart';
import 'package:cc_library/helper/open_dialog.dart';
import 'package:cc_library/widget/button/cc_base_btn.dart';
import 'package:cc_library/widget/button/cc_close_btn.dart';
import 'package:cc_library/widget/button/cc_debounce_widget.dart';
import 'package:cc_library/widget/flex/cc_column_center.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../../core/di/inject/app_inject.dart';
import '../../../../../app_track_log/ui/app_track_log_page.dart';
import '../../../../structure/getx/cc_get_view/cc_get_view.dart';
import 'simple_cubit.dart';
import 'simple_cubit_state.dart';

/// CUBIT : UI
/// Step 3 : create UI screen||page
/// - BlocProvider : init Controller
/// - BlocBuilder : notify data set changed, depends on state
///
@RoutePage()
class SimpleCubitPage extends StatelessWidget {
  const SimpleCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) => getIt<SimpleCubit>(),
          child: Builder(builder: (context) => buildPage(context)),
        ),
      ),
    );
  }

  Widget buildPage(BuildContext context) {
    return buildContainer(context);
  }

  Widget buildContainer(context) => CcColCenter(
        children: [
          buildTitle(context),
          const CcSpaceSmall(),
          item(context),
          const CcSpaceSmall(),
          item(context),
          const CcSpaceSmall(),
          buildShowAppTrackLogBtn(context),
        ],
      );

  CcNextBtn buildShowAppTrackLogBtn(context) {
    return CcNextBtn(() {
          OpenDialog.showBottomSheet(context, AppTrackLogPage(),);
        }, 'Show Track Log');
  }

  SizedBox buildTitle(context) {
    final cubit = getIt<SimpleCubit>();

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: BlocBuilder<SimpleCubit, SimpleCubitState>(
          builder: (context, state) {
            return CcText(
              cubit.counter.toString(),
              color: Colors.red,
              fontSize: 32,
            );
          },
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------
  Widget item(context) {
    final cubit = getIt<SimpleCubit>();

    return GestureDetector(
      onTap: () {

      },
      child: Container(
        height: 100,
        width: double.infinity,
        color: Colors.blueGrey,
        child: CcDebounce(
          onTap: () {
            'DebounceWidget'.Log();
          },
          child: CcCloseBtn(
            onTap: () {
              'cubit : close() :'.Log();

              cubit.increase();
            },
            icon: const Icon(
              Icons.access_alarm,
              color: Colors.blueGrey,
              size: 80,
            ),
            width: 120,
            bgColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
