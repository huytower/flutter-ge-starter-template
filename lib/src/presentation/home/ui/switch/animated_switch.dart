import 'package:cc_library/theme/base_colors.dart';
import 'package:app_config/enum/cc_vpn_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:widget/export/cc_ui_export.dart';

class AnimatedSwitch extends StatefulWidget {
  final bool isEnable;

  final CcVpnBtnStatus vpnBtnStatus;

  final Function(CcVpnBtnStatus status)? onToggleCallback;

  const AnimatedSwitch({
    Key? key,
    this.onToggleCallback,
    this.vpnBtnStatus = CcVpnBtnStatus.UNSELECT,
    this.isEnable = true,
  }) : super(key: key);

  @override
  AnimatedSwitchState createState() => AnimatedSwitchState();
}

class AnimatedSwitchState extends State<AnimatedSwitch> with TickerProviderStateMixin {
  final animationDuration = Duration(milliseconds: 100);

  var colorLoading = Colors.amber;
  var colorNormal = BaseColors.black_20;
  var colorSelect = Colors.lightGreen;
  var colorStrange = Colors.black;
  var sizeHeight = 40.0;
  var sizeWidth = 70.0;

  var status = CcVpnBtnStatus.UNSELECT;

  void onTapSwitch() {
    if (widget.isEnable) {
      setState(() {
        'AnimatedSwitchState : onTap() : '
                // '\n vpnUrl = ${VpnDataObject.vpnUrl.value}'
                // '\n vpnUsername = ${VpnDataObject.vpnUsername.value}'
                // '\n vpnPassword = ${VpnDataObject.vpnPassword.value}'
                '\n status = ${status}'
            .Log();

        when(variable: status, conditions: {
          CcVpnBtnStatus.UNSELECT: () {
            status = CcVpnBtnStatus.AWAIT_CONNECT;
          },
          CcVpnBtnStatus.LOADING: () {
            status = CcVpnBtnStatus.UNSELECT;
          },
          CcVpnBtnStatus.SELECTED: () {
            status = CcVpnBtnStatus.UNSELECT;
          },
        });

        /// Logic : return callback with latest switch status
        widget.onToggleCallback?.call(status);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    status = widget.vpnBtnStatus;

    return GestureDetector(
      onTap: () => onTapSwitch(),
      child: AnimatedContainer(
        height: sizeHeight,
        width: sizeWidth,
        duration: animationDuration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          border: Border.all(color: getColor(), width: 3),
        ),
        child: AnimatedAlign(
          duration: animationDuration,
          alignment: status == CcVpnBtnStatus.SELECTED ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              width: sizeHeight - 10,
              height: sizeHeight - 10,
              decoration: status == CcVpnBtnStatus.LOADING
                  ? null
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      color: getColor(),
                    ),
              child: status == CcVpnBtnStatus.LOADING
                  ? Center(
                      child: Container(
                        child: SpinKitFadingCircle(
                          size: sizeHeight - 10,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  Color getColor() {
    return when(
        variable: status,
        conditions: {
          CcVpnBtnStatus.UNSELECT: () {
            return colorNormal;
          },
          CcVpnBtnStatus.LOADING: () {
            return colorLoading;
          },
          CcVpnBtnStatus.SELECTED: () {
            return colorSelect;
          },
        },
        orElse: () {
          return colorNormal;
        });
  }
}
