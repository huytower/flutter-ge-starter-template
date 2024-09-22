import 'package:cc_library/theme/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ExpandCardWidget extends StatelessWidget {
  const ExpandCardWidget({
    Key? key,
    required this.bodyWidget,
    this.dividerColor,
    this.elevationCard = 8,
    this.elevationExpand = 1,
    required this.headerCollapseWidget,
    required this.headerExpandedWidget,
    required this.isExpandedStatus,
    this.shadowColor = BaseColors.gray_40,
  }) : super(key: key);

  final RxBool isExpandedStatus;

  final double elevationCard, elevationExpand;

  final Color? dividerColor, shadowColor;

  final Widget bodyWidget, headerCollapseWidget, headerExpandedWidget;

  @override
  Widget build(BuildContext context) => Card(
        color: BaseColors.transparent,
        margin: EdgeInsets.zero,
        elevation: elevationCard,
        shadowColor: shadowColor,
        child: buildExpansionPanelList(),
      );

  Widget buildExpansionPanelList() => Obx(() => ExpansionPanelList(
        dividerColor: dividerColor ?? Colors.transparent,
        elevation: elevationExpand,
        children: [
          ExpansionPanel(
            headerBuilder: (c, isExpanded) => buildHeader(isExpanded),
            body: bodyWidget,
            isExpanded: isExpandedStatus.value,
          ),
        ],
        expansionCallback: (i, isExpanded) => isExpandedStatus.value = !isExpanded,
      ));

  Widget buildHeader(bool isExpanded) => isExpanded ? headerExpandedWidget : headerCollapseWidget;
}
