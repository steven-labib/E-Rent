import '/components/show_review_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'allreviews_widget.dart' show AllreviewsWidget;
import 'package:flutter/material.dart';

class AllreviewsModel extends FlutterFlowModel<AllreviewsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for showReview dynamic component.
  late FlutterFlowDynamicModels<ShowReviewModel> showReviewModels;

  @override
  void initState(BuildContext context) {
    showReviewModels = FlutterFlowDynamicModels(() => ShowReviewModel());
  }

  @override
  void dispose() {
    showReviewModels.dispose();
  }
}
