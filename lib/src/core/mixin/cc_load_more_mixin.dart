import 'package:cc_library/constant/cc_padding_params.dart';
import 'package:cc_library/widget/api/base_progress_indicator.dart';
import 'package:cc_library/widget/flex/cc_row_center.dart';
import 'package:cc_library/widget/space/cc_space.dart';
import 'package:cc_library/widget/text/cc_text.dart';
import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

/// Load More widget
/// Only works after was included into `RefreshIndicator` widget
///
/// ex.
/// RefreshIndicator(
///       onRefresh: _refresh,
///       child: buildLoadMore(
///         onLoadMore: _loadMore,
///         child: buildBody(),
///       ))
///
mixin CcLoadMoreMixin {
  Widget buildLoadMore({
    required Future<bool> Function() onLoadMore,
    required Widget child,
  }) {
    LoadMoreDelegate.buildWidget = () => const CcLoadMoreItem();

    return LoadMore(
        delegate: LoadMoreDelegate.buildWidget(),
        textBuilder: DefaultLoadMoreTextBuilder.english,
        onLoadMore: onLoadMore,
        child: child);
  }
}

class CcLoadMoreItem extends LoadMoreDelegate {
  const CcLoadMoreItem();

  @override
  Widget buildChild(LoadMoreStatus status, {LoadMoreTextBuilder builder = DefaultLoadMoreTextBuilder.english}) {
    String text = builder(status);

    if (status == LoadMoreStatus.fail) {
      return buildText(text, color: Colors.red);
    }
    if (status == LoadMoreStatus.idle) {
      return buildText(text, color: Colors.orange);
    }
    if (status == LoadMoreStatus.loading) {
      return buildIcLoading(text);
    }
    if (status == LoadMoreStatus.nomore) {
      return buildText(text);
    }

    return buildText(text);
  }

  Widget buildIcLoading(String text) {
    return CcRowCenter(
      children: <Widget>[
        Center(child: const CcProgressIndicator(paddingTop: 0,)),

        const CcSpaceLarge(),

        buildText(
          text,
        ),
      ],
    );
  }

  CcText buildText(String text, {Color? color, TextAlign? textAlign, Alignment? align}) {
    return CcText(
      text,
      fontSize: 16,
      color: color ?? Colors.grey,
      textAlign: textAlign ?? TextAlign.center,
      align: align ?? Alignment.center,
    );
  }
}
